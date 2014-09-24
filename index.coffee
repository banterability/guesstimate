{countBy, filter, first, last, map, max, min, pairs, reduce, uniq} = require 'underscore'

class Stats
  constructor: (@list) ->

  all: ->
    max: @max()
    mean: @mean()
    median: @median()
    min: @min()
    mode: @mode()
    range: @range()
    sum: @sum()

  max: ->
    max @list

  mean: ->
    @sum() / @list.length

  median: ->
    list = @_sortedList()
    middleIndex = (listLength = list.length + 1) / 2 - 1
    if _isEven listLength
      list[middleIndex]
    else
      leftOfMiddle = list[Math.floor(middleIndex)]
      rightOfMiddle = list[Math.ceil(middleIndex)]
      (leftOfMiddle + rightOfMiddle) / 2

  min: ->
    min @list

  mode: ->
    frequency = pairs countBy @list
    [maxValue, maxCount] = max frequency, (value) -> value[1]
    allMostFrequentPair = filter frequency, (value) -> value[1] == maxCount
    allMostFrequentValues = map allMostFrequentPair, (value) -> parseInt value[0], 10

    return undefined if allMostFrequentValues.length == uniq(@list).length
    parseInt(maxValue, 10)

  range: ->
    list = @_sortedList()
    last(list) - first(list)

  sum: ->
    reduce @list, (memo, value) ->
      memo + value
    , 0

  _sortedList: ->
    @list.sort()

_isEven = (num) ->
  num % 2 == 0

module.exports = Stats
