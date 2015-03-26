React = require 'react'

module.exports = React.createClass
  render: ->
    {coverImg, mission} = @props
    {source, width, height} = coverImg

    <section id="hero">
      <img src={source} width={width} height={height} />
      <div className="group">
        <p className="ten columns offset-one">{mission}</p>
      </div>
    </section>
