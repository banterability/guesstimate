assert = require 'assertive'
Stats = require '../index'

describe 'Stats', ->
  it 'exists', ->
    assert.expect Stats

  describe 'all', ->
    it 'provides all statistics for an array', ->
      actual = Object.keys new Stats([1,2,3,4,5,6]).all()
      assert.include 'max', actual
      assert.include 'mean', actual
      assert.include 'median', actual
      assert.include 'min', actual
      assert.include 'mode', actual
      assert.include 'range', actual
      assert.include 'standardDeviation', actual
      assert.include 'sum', actual

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

    describe 'special cases', ->
      it 'finds no mode if no values repeat', ->
        actual = new Stats([1,2,3,4]).mode()
        assert.falsey actual

      it 'finds no mode if all values have equal frequency', ->
        actual = new Stats([1,1,2,2,3,3]).mode()
        assert.falsey actual

      it 'supports bimodal lists', ->
        actual = new Stats([1,2,2,3,4,4,5]).mode()
        assert.deepEqual [2, 4], actual

      it 'supports multimodal lists', ->
        actual = new Stats([1,1,2,2,3,3,4]).mode()
        assert.deepEqual [1,2,3], actual

  describe 'range', ->
    it 'provides the range for an array', ->
      actual = new Stats([1,2,3,4,5,6]).range()
      assert.equal 5, actual

  describe 'standard deviation', ->
    it 'provides the range for an array', ->
      actual = new Stats([65,66,66,62,62,60,58]).standardDeviation()
      assert.equal 2.864276807966203, actual

  describe 'sum', ->
    it 'provides the sum of items in an array', ->
      actual = new Stats([1,2,3,4,5,6]).sum()
      assert.equal 21, actual
