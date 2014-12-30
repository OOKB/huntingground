React = require 'react'

module.exports = React.createClass
  render: ->
    {instagram} = @props.data

    pics = for pic, i in instagram
      <li key={pic.id}> <img src={pic.url} width={pic.width} height={pic.height} /> </li>

    <section id="instagram">
      <h3>Instagram</h3>
      <ul> {pics} </ul>
    </section>
