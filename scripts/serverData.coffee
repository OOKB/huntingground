r = require 'request'
_ = require 'queries'
async = require 'async'

module.exports = (file, callback) ->
  data = JSON.parse String(file.contents)
  fb = (cb) ->
    if _.isString data.facebook
      r 'http://social.cape.io/facebook/'+data.facebook, (err, resp, body) ->
        if err then throw err
        data.facebook = JSON.parse body
        console.log 'fb done'
        cb()
    else
      cb()

  insta = (cb) ->
    if _.isString data.instagram
      r 'http://social.cape.io/instagram/'+data.instagram, (err, resp, body) ->
        if err then throw err
        data.instagram = JSON.parse body
        console.log 'insta done'
        cb()
    else
      cb()

  save = ->
    file.contents = new Buffer JSON.stringify(data)
    console.log data
    callback()

  async.parallel [fb, insta], save

  console.log 'run'
