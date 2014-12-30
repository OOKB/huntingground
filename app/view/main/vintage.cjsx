React = require 'react'

module.exports = React.createClass
  render: ->

    {about, how, trends} = @props.data

    <section id="vintage">
      <h3>Vintage</h3>
      <div className="group">
        <p className="four columns">
          {about}
        </p>
        <p className="four columns">
          <em>How It Works:</em>
          {how}
        </p>
        <p className="four columns">
          {trends}
        </p>
      </div>
    </section>
