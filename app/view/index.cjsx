React = require 'react'

Head = require './head/head'
Foot = require './foot/foot'

module.exports = React.createClass
  render: ->
    {title, tagline} = @props.data
    pgTitle = title + ' | ' + tagline

    <html>
      <head>
        <title>{pgTitle}</title>
        <link rel="stylesheet" href="app.css" />
      </head>
      <body>
        <Head data={@props.data} />
        <h1>{title}</h1>
        <script src="/assets/app.js" />
        <Foot data={@props.data} />
      </body>
    </html>
