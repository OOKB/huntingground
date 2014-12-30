React = require 'react'
_ = require 'queries'

data = require './data/data'
fb = require './data/facebook'
instagram = require './data/instagram'

data.title = fb.name
data.address = fb.location.street
data.phone = fb.phone
data.instagram = _.map instagram, (pic) ->
  imgData = pic.images.standard_resolution
  imgData.id = pic.id
  imgData

Index = require './view/index'

App = (vars) ->
  React.createElement Index, {data: data, vars: vars}

if typeof window isnt "undefined"
  window.onload = -> # Attach event handlers.
    # Attach app to global window var as app.
    window.app =
      db: data # Our database.
    React.render App(), document

module.exports = App
