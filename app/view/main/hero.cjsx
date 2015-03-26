React = require 'react'

module.exports = React.createClass
  render: ->
    {coverImg, mission} = @props

    if coverImg
      {url, width, height} = coverImg
      BigImgEl = <img src={url} width={width} height={height} />

    <section id="hero">
      {BigImgEl}
      <div className="group">
        <p className="ten columns offset-one">{mission}</p>
      </div>
    </section>
