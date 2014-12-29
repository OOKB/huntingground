# Core node modules.
fs = require 'fs'
# Contrib.
nodejsx = require("node-cjsx").transform()
React = require 'react'
# Custom.
App     = React.createFactory(require '../app/index')

# Run Code.
app = App
  path: '/' # index page. Could be changed for other pages.

markup = React.renderToString app
fs.writeFile('public/index.html', "<!doctype html>\n" + markup)
