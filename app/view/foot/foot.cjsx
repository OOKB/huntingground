React = require 'react'

module.exports = React.createClass
  render: ->

    {location, phone} = @props
    {street, city, state, zip} = location

    address = "#{street} #{city}, #{state}. #{zip}"
    <footer>
      <div className="right socialmedia">
        <ul id="sociallinks">
          <li className="fb"><a href="http://www.facebook.com/pages/Hunting-Ground/330679596992065">Facebook</a></li>
          <li className="insta"><a href="http://instagram.com/huntingground">Instagram</a></li>
        </ul>
      </div>

      <ul>
        <li><p>{address} · {phone}</p></li>
        <li><p><em>M.–Th.</em> 11–7 · <em>Fr. &amp; Sa.</em> 11–8 · <em>Su.</em> 12–6</p></li>
      </ul>

    </footer>
