React = require 'react'
_ = require 'queries'

data = require './data/data'
fb = require './data/facebook'
data.title = fb.name
data.address = fb.location.street

data.phone = fb.phone

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
