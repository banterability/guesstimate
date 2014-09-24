assert = require 'assertive'
Stats = require '../index'

describe 'Stats', ->
  it 'exists', ->
    assert.expect Stats

  describe 'all', ->
    it 'provides all statistics for an array', ->
      actual = new Stats([1,2,3,4,5,6]).all()
      assert.expect actual.max
      assert.expect actual.mean
      assert.expect actual.median
      assert.expect actual.min
      assert.expect actual.mode
      assert.expect actual.range
      assert.expect actual.sum

  describe 'max', ->
    it 'provides the maximum value in an array', ->
      actual = new Stats([2,5,1,3,6,4]).max()
      assert.equal 6, actual

  describe 'mean', ->
    it 'provides the mean for an array', ->
      actual = new Stats([1,2,3,4,5,6]).mean()
      assert.equal 3.5, actual

  describe 'median', ->
    it 'provides the median for an array with an odd number of items', ->
      actual = new Stats([6,4,6,5,4]).median()
      assert.equal 5, actual

    it 'provides the median for an array with an even number of items', ->
      actual = new Stats([6,4,6,4]).median()
      assert.equal 5, actual

  describe 'min', ->
    it 'provides the minimum value in an array', ->
      actual = new Stats([2,5,1,3,6,4]).min()
      assert.equal 1, actual

  describe 'mode', ->
    it 'provides the mode of an array', ->
      actual = new Stats([1,2,2,3,4]).mode()
      assert.equal 2, actual

  describe 'range', ->
    it 'provides the range for an array', ->
      actual = new Stats([1,2,3,4,5,6]).range()
      assert.equal 5, actual

  describe 'sum', ->
    it 'provides the sum of items in an array', ->
      actual = new Stats([1,2,3,4,5,6]).sum()
      assert.equal 21, actual
