React = require 'react'

module.exports = React.createClass
  render: ->
    {coverImg} = @props.data

    <section className="hero">
      <img src={coverImg.url} width={coverImg.width} height={coverImg.height} />
    </section>
