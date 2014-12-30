React = require 'react'

module.exports = React.createClass
  render: ->

    {mission} = @props.data

    <section id="about">
      <p>{mission}</p>
    </section>
