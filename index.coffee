{first, last} = require 'underscore'

class Stats
  constructor: (@list) ->

  range: ->
    list = @_sortedList()
    last(list) - first(list)

  _sortedList: ->
    @list.sort()

module.exports = Stats
