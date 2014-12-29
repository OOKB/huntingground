React = require 'react'
_ = require 'queries'

data = require './data/data'

app = React.createClass
  render: ->
    <html>
      <head>
        <title>{@props.title} | {@props.tagline}</title>
        <link rel="stylesheet" href="app.css" />
      </head>
      <body>

        <div id="wrapper">
          <h1>{@props.title}</h1>

          <header>

            <figure class="logo">
              <a href="#" title="{@props.title}" rel="home">
                <img src="logo.png" alt="Home" />
              </a>
            </figure>

            <hgroup>
              <h2>“{@props.tagline}”</h2>
            </hgroup>

            <nav>
              <ul>
                <li><a href="#">About</a></li>
                <li><a href="#">Vintage</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Directions</a></li>
              </ul>
            </nav>

          </header>

          <main>

            <section class="hero">

              <img src="http://www.shophuntingground.com/sites/shophuntingground.com/files/styles/homepage_images/public/field/image/combo3.jpg%3Fitok=apLGIkPZ" />

            </section>

            <section id="about" class="mission lead">
              <p>{@props.mission}</p>
            </section

            <section id="instagram">
              <h3>Instagram</h3>
            </section>

            <section id="vintage">
              <h3>Vintage</h3>
              <div class="group">
                <p class="four columns">
                  {@props.about}
                </p>
                <p class="four columns">
                  {@props.how}
                </p>
                <p class="four columns">
                  {@props.how}
                </p>
              </div>
            </section>

            <section id="contact">
              <h3>Contact</h3>
            </section>

            <section id="directions">
              <h3>Directions</h3>
              <div class="group">
                <p class="six columns">
                  {@props.south}
                </p>
                <p class="six columns">
                  {@props.north}
                </p>
              </div>
            </section>

          </main>

          <footer>

            <ul>
              <li><p>3649 Falls Road, Balto, Md. 21211 · (410) 243-0789</p></li>
              <li><p><em>M.–Th.</em> 11–7 · <em>Fr. &amp; Sa.</em> 11–8 · <em>Su.</em> 12–6</p></li>
            </ul>

            <div  class="right clearfix socialmedia ">
              <ul id="sociallinks">
                <li class="fb"><a href="http://www.facebook.com/pages/Hunting-Ground/330679596992065">Facebook</a></li>
                <li class="insta"><a href="http://instagram.com/huntingground">Instagram</a></li>
              </ul>
            </div>

          </footer>
        </div>

        <script src="/assets/app.js" />
      </body>
    </html>

module.exports = app;

if typeof window isnt "undefined"
  window.onload = -> # Attach event handlers.
    App = React.createFactory app
    # Attach app to global window var as app.
    window.app =
      db: data # Our database.
    React.render App(data), document
