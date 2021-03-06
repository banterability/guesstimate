// Generated by CoffeeScript 1.8.0
(function() {
  var Guesstimate, countBy, filter, first, last, map, max, min, pairs, reduce, uniq, _isEven, _ref;

  _ref = require('underscore'), countBy = _ref.countBy, filter = _ref.filter, first = _ref.first, last = _ref.last, map = _ref.map, max = _ref.max, min = _ref.min, pairs = _ref.pairs, reduce = _ref.reduce, uniq = _ref.uniq;

  Guesstimate = (function() {
    function Guesstimate(list) {
      this.list = list;
    }

    Guesstimate.prototype.all = function() {
      return {
        max: this.max(),
        mean: this.mean(),
        median: this.median(),
        min: this.min(),
        mode: this.mode(),
        range: this.range(),
        standardDeviation: this.standardDeviation(),
        sum: this.sum(),
        variance: this.variance()
      };
    };

    Guesstimate.prototype.max = function() {
      return max(this.list);
    };

    Guesstimate.prototype.mean = function() {
      return this.sum() / this.list.length;
    };

    Guesstimate.prototype.median = function() {
      var leftOfMiddle, list, listLength, middleIndex, rightOfMiddle;
      list = this._sortedList();
      middleIndex = (listLength = list.length + 1) / 2 - 1;
      if (_isEven(listLength)) {
        return list[middleIndex];
      } else {
        leftOfMiddle = list[Math.floor(middleIndex)];
        rightOfMiddle = list[Math.ceil(middleIndex)];
        return (leftOfMiddle + rightOfMiddle) / 2;
      }
    };

    Guesstimate.prototype.min = function() {
      return min(this.list);
    };

    Guesstimate.prototype.mode = function() {
      var allMostFrequentPair, allMostFrequentValues, frequency, maxCount, maxValue, _ref1;
      frequency = pairs(countBy(this.list));
      _ref1 = max(frequency, function(value) {
        return value[1];
      }), maxValue = _ref1[0], maxCount = _ref1[1];
      allMostFrequentPair = filter(frequency, function(value) {
        return value[1] === maxCount;
      });
      allMostFrequentValues = map(allMostFrequentPair, function(value) {
        return parseInt(value[0], 10);
      });
      if (allMostFrequentValues.length === uniq(this.list).length) {
        return void 0;
      }
      if (allMostFrequentValues.length === 1) {
        return allMostFrequentValues[0];
      }
      return allMostFrequentValues;
    };

    Guesstimate.prototype.range = function() {
      var list;
      list = this._sortedList();
      return last(list) - first(list);
    };

    Guesstimate.prototype.standardDeviation = function() {
      return Math.sqrt(this.variance());
    };

    Guesstimate.prototype.sum = function() {
      return reduce(this.list, function(memo, value) {
        return memo + value;
      }, 0);
    };

    Guesstimate.prototype.variance = function() {
      var mean, totalDifference;
      mean = this.mean();
      totalDifference = reduce(this.list, function(memo, value) {
        return memo + Math.pow(value - mean, 2);
      }, 0);
      return totalDifference / this.list.length;
    };

    Guesstimate.prototype._sortedList = function() {
      return this.list.sort();
    };

    return Guesstimate;

  })();

  _isEven = function(num) {
    return num % 2 === 0;
  };

  module.exports = Guesstimate;

}).call(this);
