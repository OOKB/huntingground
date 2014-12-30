React = require 'react'

Hero = require './hero'
About = require './about'
Instagram = require './instagram'
Vintage = require './vintage'
Contact = require './contact'
Directions = require './directions'


module.exports = React.createClass
  render: ->

    {data} = @props

    <main>
      <Hero data={data} />
      <About data={data} />
      <Instagram data={data} />
      <Vintage data={data} />
      <Contact data={data} />
      <Directions data={data} />
    </main>
