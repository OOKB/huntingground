React = require 'react'

module.exports = React.createClass
  render: ->

    {mission} = @props.data

    <section id="about">
      <div className="group">
        <p className="eight columns offset-two">{mission}</p>
      </div>
    </section>
