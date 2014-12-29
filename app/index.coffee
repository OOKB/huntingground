React = require 'react'
_ = require 'queries'

data = require './data/data'

app = React.createClass
  render: ->
    <html>
      <head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
      </head>
      <body>
        <h1>{@props.title}</h1>
        <script src="/assets/app.js" />
      </body>
    </html>

module.exports = app;

if typeof window isnt "undefined"
  window.onload = -> # Attach event handlers.
    App = React.createFactory app
    # Attach app to global window var as app.
    window.app =
      db: data # Our database.
    React.render App(data), document
