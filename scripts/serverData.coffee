r = require 'request'
_ = require 'queries'
async = require 'async'
fs = require 'fs-extra'
imgix = require './imgix'

data = require '../app/data/data'

module.exports = (callback) ->

  getData =
    fb: (cb) ->
      if data.facebook
        r 'http://social.cape.io/facebook/'+data.facebook, (err, resp, body) ->
          console.log 'fb done'
          cb err, JSON.parse(body)
      else
        cb(null, false)

    insta: (cb) ->
      if data.instagram
        r 'http://social.cape.io/instagram/'+data.instagram, (err, resp, body) ->
          console.log 'insta done'
          cb err, JSON.parse(body)
      else
        cb(null, false)

  save = (err, serverData) ->
    console.log 'save'
    {fb, insta} = serverData

    data.title = fb.name
    data.address = "#{fb.location.street}, #{fb.location.city}, #{fb.location.state}. #{fb.location.zip}"
    data.phone = fb.phone
    data.coverImg = _.rename fb.cover.images[0], {source: 'url'}

    # Extract the fields we want from the data feed.
    data.instagram = _.map insta, (pic) ->
      imgData = pic.images.standard_resolution
      imgData.id = pic.id
      imgData.caption = pic.caption.text
      imgData
    # Slice the array down to 6 items. Item 0 through item 5.
    data.instagram = data.instagram[0..5]

    # IMGIX
    key = process.env.IMGIX_CAPE
    domain = 'cape.imgix.net'
    ops =
      h: 480
      w: Math.min(data.coverImg.width, 900)
      fit: 'crop'

    console.log key, domain

    data.coverImg.url = imgix domain, key, data.coverImg.url, ops

    fs.outputJsonSync 'app/data/index.json', data
    if _.isFunction callback
      callback()

  async.parallel getData, save
