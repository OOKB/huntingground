React = require 'react'

module.exports = React.createClass
  render: ->

    <section id="directions">
      <h3>Directions</h3>
      <div className="group">
        <p className="six columns">
          {@props.south}
        </p>
        <p className="six columns">
          {@props.north}
        </p>
      </div>
    </section>
