React = require 'react'

Nav = require './nav'

module.exports = React.createClass
  render: ->
    {title, tagline} = @props

    <header>
      <figure>
        <a href="#" title={title} rel="home">
          <img src="logo.png" alt="Home" />
        </a>
      </figure>

      <hgroup>
        <h2>{tagline}</h2>
      </hgroup>

      <Nav />
    </header>
