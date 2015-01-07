React = require 'react'

module.exports = React.createClass
  render: ->

    {address, phone} = @props.data

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

      <div className="credits">
        <p>Site by <a href="http://www.ookb.co/">OOKB</a> / Powered by <a href="http://www.cape.io/">CAPE</a></p>
      </div>

    </footer>
