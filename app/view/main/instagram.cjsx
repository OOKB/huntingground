React = require 'react'
_ = require 'lodash'

module.exports = React.createClass

  getInitialState: ->
    height: null

  handleResize: ->
    maxHeight = @state.height

    _.each document.getElementsByClassName('polaroid'), (el) ->
      if el.offsetHeight > maxHeight then maxheight = el.offsetHeight
      console.log el.offsetHeight

    @setState height: maxHeight

  componentDidMount: ->
    @handleResize()

  render: ->
    {images} = @props
    {height} = @state

    pics = for pic, i in images
      {caption:{text}, images: {standard_resolution:{url}}} = pic
      {id, dateCreated} = pic
      <li className="four columns" key={id}>
        <div className="polaroid" style={height: height}>
          <div className="date">{dateCreated.format('MMM Do, LTS')}</div>
          <img src={url} />
          <p>{text}</p>
        </div>
      </li>

    <section id="instagram">
      <ul className="group"> {pics} </ul>
    </section>
