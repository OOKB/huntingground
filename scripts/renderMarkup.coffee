# Core node modules.
fs = require 'fs'
# Contrib.
nodejsx = require 'coffee-react/register'
React = require 'react'
# Custom.
App = require '../app/app'

# Run Code.
# app = App
vars =
  path: '/' # index page. Could be changed for other pages.

markup = React.renderToString App(vars)
fs.writeFile('public/index.html', "<!doctype html>\n" + markup)
