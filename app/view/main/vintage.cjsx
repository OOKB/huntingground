React = require 'react'

module.exports = React.createClass
  render: ->

    {about, how} = @props.data

    <section id="vintage">
      <h3>Vintage</h3>
      <div className="group">
        <p className="four columns">
          {about}
        </p>
        <p className="four columns">
          {how}
        </p>
      </div>
    </section>
