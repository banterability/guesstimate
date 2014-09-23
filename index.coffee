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
    middleIndex = (listLength = list.length + 1) / 2 - 1
    if _isEven listLength
      list[middleIndex]
    else
      leftOfMiddle = list[Math.floor(middleIndex)]
      rightOfMiddle = list[Math.ceil(middleIndex)]
      (leftOfMiddle + rightOfMiddle) / 2

  range: ->
    list = @_sortedList()
    last(list) - first(list)

  _sortedList: ->
    @list.sort()

_isEven = (num) ->
  num % 2 == 0

module.exports = Stats
