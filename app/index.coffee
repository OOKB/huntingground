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

            <nav  role="navigation">
              <ul>
                <li><a href="#">About</a></li>
                <li><a href="#">Vintage</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Directions</a></li>
              </ul>
            </nav>

          </header>

          <main>
          </main>

          <footer>
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
