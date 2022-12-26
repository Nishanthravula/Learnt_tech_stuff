var romanToInt = function(s) {    
    const r = { 
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }
    let result = 0;
    for (let i=0; i < s.length; i++){
        const cur = r[s[i]];
        const nxt = r[s[i+1]];
        if (cur < nxt){
            result += nxt - cur // IV -> 5 - 1 = 4
            i++
        } else {
            result += cur
        }
    }
    return result; 
};