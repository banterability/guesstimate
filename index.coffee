{first, last, reduce} = require 'underscore'

class Stats
  constructor: (@list) ->

  mean: ->
    sum = reduce @list, (memo, value) ->
      memo += value
    , 0
    sum / @list.length

  range: ->
    list = @_sortedList()
    last(list) - first(list)

  _sortedList: ->
    @list.sort()

module.exports = Stats
