React = require 'react'
Wufoo = require './wufoo'

module.exports = React.createClass
  render: ->
    {hash, subdomain} = @props.wufoo

    <section id="contact">
      <h3>Contact</h3>
      <Wufoo hash={hash} subdomain={subdomain} />
    </section>
