React = require 'react'
_ = require 'queries'

data = require './data'
fb = require './data/facebook'
instagram = require './data/instagram'

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
