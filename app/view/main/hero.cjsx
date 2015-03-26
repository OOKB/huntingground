React = require 'react'

module.exports = React.createClass
  render: ->
    {coverImg, mission} = @props

    <section id="hero">
      <img src={coverImg.url} width={coverImg.width} height={coverImg.height} />
      <div className="group">
        <p className="ten columns offset-one">{mission}</p>
      </div>
    </section>
