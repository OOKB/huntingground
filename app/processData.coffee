_ = require 'lodash'
moment = require 'moment'

module.exports = (data) ->
  data.currentYear = new Date().getFullYear()

  if data.instagram
    data.instagram = _.map data.instagram, (img, i) ->
      img.dateCreated = moment img.created_time, 'X'
      return img

  return data
