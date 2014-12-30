React = require 'react'

Head = require './head/head'
Main = require './main/main'
Foot = require './foot/foot'

module.exports = React.createClass
  render: ->
    {title, tagline} = @props.data
    pgTitle = title + ' | ' + tagline

    <html>
      <head>
        <title>{pgTitle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/app.css" />
      </head>
      <body>
        <div id="wrapper">
          <Head data={@props.data} />
          <h1>{title}</h1>
          <Main data={@props.data} />
          <Foot data={@props.data} />
        </div>
        <script src="/assets/app.js" />
      </body>
    </html>
