var isValid = function(s) {
   var stk = [];
  var len = s.length;
  var map = {
    '(': ')',
    '[': ']',
    '{': '}'
  };
  for (var i = 0; i < len; i++) {
    if (stk.length > 0 && map[stk[stk.length - 1]] === s[i]) {
      stk.pop();
    } else {
      stk.push(s[i]);
    }
  }
  return stk.length === 0;
};