React = require 'react'

module.exports = React.createClass
  render: ->
    {images} = @props

    pics = for pic, i in images
      {id, caption:{text}, images: {standard_resolution:{height, url, width}}} = pic
      <li className="four columns" key={id}>
        <div className="polaroid">
          <img src={url} width={width} height={height} />
          <p>{text}</p>
        </div>
      </li>

    <section id="instagram">
      <ul className="group"> {pics} </ul>
    </section>
