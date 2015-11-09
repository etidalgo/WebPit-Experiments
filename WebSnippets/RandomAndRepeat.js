

var getRandomInt = function (min, max) {

  return Math.floor(Math.random() * (max - min)) + min;

};

var repeatFx = function (fn, times) {

    for(var i = 0; i < times; i++)fn();

}

var getRandomInt2 = function() { return getRandomInt(1, 10); };

repeatFx( (function() { console.log(getRandomInt2()); }), 3 );
