#path = require 'path'
#fs = require 'fs-extra'
exec = require('child_process').exec

gulp = require 'gulp'
#r = require 'request'

browserSync = require 'browser-sync'

browserify = require 'browserify'
exorcist = require 'exorcist'
#coffeeify = require 'coffeeify'
#bd = require 'browserify-data'

#source = require('vinyl-source-stream')
transform = require 'vinyl-transform'

#less = require 'gulp-less'
#clean = require 'gulp-clean'
#zopfli = require 'gulp-zopfli'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
#runSequence = require 'run-sequence'
#markdown = require 'gulp-markdown-to-json'
#yaml = require 'gulp-yaml'

# Default gulp tasks watches files for changes
gulp.task "default", ['browser-sync'], ->
  gulp.watch './app/**/*.*', ['templates', 'prodCompile', browserSync.reload]
  gulp.watch "styles/*.less", ["styles", browserSync.reload]
  gulp.watch 'static/**', ['static', browserSync.reload]
  gulp.watch './content/**/*.md', ['content', browserSync.reload]
  gulp.watch './content/**/*.yaml', ['data', browserSync.reload]
  return

# For development.
gulp.task "browser-sync", ['compile', 'templates'], ->
  browserSync
    server:
      baseDir: 'public'
    logConnections: true
    injectChanges: false
    #logLevel: 'debug'
  return

# This generate js app file.
gulp.task 'compile', ['data', 'content', 'static'], (cb) ->
  browserified = transform (filename) ->
    b = browserify {debug: true}
    b.add filename
    b.bundle()
  gulp.src 'app/index.coffee'
    .pipe browserified
    # Extract the map.
    .pipe transform(-> exorcist('./public/assets/app.js.map'))
    # Shrink the codebase.
    .pipe uglify()
    # Rename the file.
    .pipe rename('app.js')
    .pipe gulp.dest('./public/assets')

# Convert yaml files from the content dir to json files.
gulp.task 'data', ->
  gulp.src './content/**/*.yaml'
    .pipe yaml()
    .pipe gulp.dest('./app/data/')

# Convert markdown files from content dir to json files.
gulp.task 'content', ->
  gulp.src './content/**/*.md'
    .pipe markdown()
    .pipe gulp.dest('./app/data/')

# Compile the static html files.
gulp.task 'templates', (cb) ->
  # Calling an external script for this.
  exec 'coffee ./scripts/renderMarkup.coffee', (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err

# Process LESS to CSS.
gulp.task 'styles', ->
  gulp.src(["styles/app.less", 'styles/print.less', 'styles/iefix.less'])
    .pipe less(paths: [path.join(__dirname, "less", "includes")])
    .pipe gulp.dest("./dev")

# Copy static files.
gulp.task 'static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./dev/')

# Watchify the main app file.
# gulp.task 'compile', ->
#   opts = watchify.args
#   opts.extensions = ['.coffee', '.json']
#   opts.debug = true
#   w = watchify(browserify('./app/index.coffee', opts))
#   w.transform coffeeify
#   w.transform bd
#   bundle = () ->
#     w.bundle()
#       .pipe(source('app.js'))
#       .pipe(gulp.dest('./dev/'))
#   w.on('update', bundle)
#   bundle()
#   return


# - - - - prod - - - -

gulp.task 'prod', (cb) ->
  runSequence ['prod_clean', 'set_sha', 'serverData', 'data', 'content'],
    ['templatesProd', 'prod_static', 'copy_css', 'prod_compile'],
    'compress',
    cb
  return

# gulp.task 'templatesProd', ->
#   exec('coffee gulp/compileProd.coffee')

gulp.task 'set_sha', (cb) ->
  r_ops =
    uri: 'https://api.github.com/repos/cape-io/mica.ezle.io/branches/master'
    json: true
    headers:
      'user-agent': 'request.js'
  r r_ops, (err, response, body) ->
    if err then throw err
    global.sha = body.commit.sha
    fs.outputJsonSync 'app/data/commit.json', body.commit
    cb()
  return

# Remove contents from prod directory.
gulp.task 'prod_clean', ->
  gulp.src('./prod', read: false)
    .pipe(clean())

gulp.task 'prod_static', ->
  gulp.src('./static/**')
    .pipe gulp.dest('./prod/')

gulp.task 'cssProd', ->
  runSequence 'set_sha', ['copy_css', 'templatesProd']
  return

gulp.task 'copy_css', ['styles'], ->
  gulp.src('./dev/app.css')
    .pipe(rename(global.sha+'.css'))
    .pipe(gulp.dest('./prod'))
  gulp.src('./dev/print.css')
    .pipe(gulp.dest('./prod'))

gulp.task 'compress', ->
  gulp.src("./prod/*.{js,css,html,json}")
    .pipe(zopfli())
    .pipe(gulp.dest("./prod"))
