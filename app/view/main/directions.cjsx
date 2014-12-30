React = require 'react'

module.exports = React.createClass
  render: ->
    {north, south} = @props.data.directions

    <section id="directions">
      <h3>Directions</h3>
      <div className="group">
        <p className="six columns">
          {south}
        </p>
        <p className="six columns">
          {north}
        </p>
      </div>
    </section>
