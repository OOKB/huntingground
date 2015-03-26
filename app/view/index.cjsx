React = require 'react'

Head = require './head/head'
Main = require './main/main'
Foot = require './foot/foot'

module.exports = React.createClass
  render: ->
    {facebook, db, instagram} = @props
    {name, location, phone} = facebook
    {tagline, wufoo, directions, vintage} = db

    pgTitle = "#{name} | #{tagline}"

    <html>
      <head>
        <title>{pgTitle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/app.css" />
      </head>
      <body>
        <div id="wrapper">
          <Head data={@props} />
          <h1>{name}</h1>
          <Main facebook={facebook} instagram={instagram} wufoo={wufoo} directions={directions} vintage={vintage} />
          <Foot location={location} phone={phone} />

          <div className="credits">
            <p>Site by <a href="http://www.ookb.co/">OOKB</a> / Powered by <a href="http://www.cape.io/">CAPE</a></p>
          </div>

        </div>
        <script src="/assets/app.js" />
      </body>
    </html>
