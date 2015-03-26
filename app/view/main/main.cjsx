React = require 'react'

Hero = require './hero'
Instagram = require './instagram'
Vintage = require './vintage'
Contact = require './contact'
Directions = require './directions'


module.exports = React.createClass
  render: ->

    {facebook: {impressum, cover: {images: [coverImg]}}, instagram, wufoo} = @props
    {north, south} = @props.directions
    {about, how, trends} = @props.vintage

    <main>
      <Hero coverImg={coverImg} mission={impressum} />
      <Instagram images={instagram} />
      <Vintage about={about} how={how} trends={trends} />
      <Contact id={wufoo.id} subdomain={wufoo.subdomain} />
      <Directions north={north} south={south} />
    </main>
