React = require 'react'

module.exports = React.createClass
  render: ->
    {coverPhotos, mission} = @props

    if coverPhotos and urlWide = coverPhotos[0]?.urlWide
      BigImgEl = <img src={urlWide} width="720" height="480" />

    <section id="hero">
      {BigImgEl}
      <div className="group">
        <p className="ten columns offset-one">{mission}</p>
      </div>
    </section>
