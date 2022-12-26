var removeDuplicates = function(nums) {
  var len = nums.length;
  var lst = NaN;
  var c = 0;
  for (var i = 0; i < len; i++) {
    if (nums[i] !== lst) {
      nums[c] = nums[i];
      lst = nums[i];
      c++;
    }
  }
  return c;
};