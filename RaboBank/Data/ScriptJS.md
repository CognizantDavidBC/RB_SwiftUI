```
function (line) {
  let min = 0
  let max = 20
  let skew = 1.2
  let u = 0, v = 0;
  while(u === 0) u = Math.random()
  while(v === 0) v = Math.random()
  let num = Math.sqrt( -2.0 * Math.log( u ) ) * Math.cos( 2.0 * Math.PI * v )
  
  num = num / 10.0 + 0.5

  num = Math.pow(num, skew)
  num *= max - min
  num += min

  return Math.max(0, Math.min(40, parseInt(num) + Math.floor(Math.random() * 20 - 10)));
}
```
