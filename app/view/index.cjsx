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

          <div className="credits">
            <p>Site by <a href="http://www.ookb.co/">OOKB</a> / Powered by <a href="http://www.cape.io/">CAPE</a></p>
          </div>

        </div>
        <script src="/assets/app.js" />
      </body>
    </html>
