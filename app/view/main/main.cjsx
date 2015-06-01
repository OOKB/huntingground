React = require 'react'

Hero = require './hero'
Instagram = require './instagram'
Vintage = require './vintage'
Contact = require './contact'
Directions = require './directions'


module.exports = React.createClass
  render: ->

    {facebook: {impressum, coverPhotos}, instagram, wufoo} = @props

    if @props.vintage
      {about, how, trends} = @props.vintage
      VintageEl = <Vintage about={about} how={how} trends={trends} />

    if @props.directions
      {north, south} = @props.directions
      DirectionsEl = <Directions north={north} south={south} />

    if wufoo
      ContactEl = <Contact wufoo={wufoo} />

    <main>
      <Hero coverPhotos={coverPhotos} mission={impressum} />
      <Instagram images={instagram} />
      {VintageEl}
      {ContactEl}
      {DirectionsEl}
    </main>
