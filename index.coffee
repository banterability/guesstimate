{first, last, reduce} = require 'underscore'

class Stats
  constructor: (@list) ->

  all: ->
    mean: @mean()
    median: @median()
    range: @range()

  mean: ->
    sum = reduce @list, (memo, value) ->
      memo += value
    , 0
    sum / @list.length

  median: ->
    list = @_sortedList()
    middleIndex = Math.round(list.length / 2) - 1
    list[middleIndex]

  range: ->
    list = @_sortedList()
    last(list) - first(list)

  _sortedList: ->
    @list.sort()

module.exports = Stats
