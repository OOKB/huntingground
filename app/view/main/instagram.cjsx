React = require 'react'
_ = require 'lodash'

module.exports = React.createClass

  getInitialState: ->
    height: null

  handleResize: ->
    maxHeight = @state.height or 0
    _.each document.getElementsByClassName('polaroid'), (el) ->
      if el.offsetHeight > maxHeight
        maxHeight = el.offsetHeight
    @setState height: maxHeight
    console.log 'new maxHeight', maxHeight

  componentDidMount: ->
    @handleResize()

  render: ->
    {images} = @props
    {height} = @state
    if images and images.length
      pics = for pic, i in images
        pic.caption = pic.caption or {text: ''}
        {caption:{text}, images: {standard_resolution:{url}}} = pic
        {id, dateCreated} = pic
        <li className="four columns" key={id}>
          <div className="polaroid" style={height: height}>
            <div className="date">{dateCreated.format('MMM Do, LTS')}</div>
            <img src={url} />
            <p>{text}</p>
          </div>
        </li>
    else
      return false

    <section id="instagram">
      <ul className="group"> {pics} </ul>
    </section>
