assert = require 'assertive'
Stats = require '../index'

describe 'Stats', ->
  it 'exists', ->
    assert.expect Stats

  describe 'mean', ->
    it 'provides the mean for an array', ->
      actual = new Stats([1,2,3,4,5,6]).mean()
      assert.equal 3.5, actual

  describe 'range', ->
    it 'provides the range for an array', ->
      actual = new Stats([1,2,3,4,5,6]).range()
      assert.equal 5, actual
