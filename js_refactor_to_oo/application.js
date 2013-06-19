var addDiceButton = '#roller button.add';
var rollDiceButton = '#roller button.roll';
var dice = [];

function addDice() {
  var die = new Die(0);
  dice.push(die);
  die.render();
}

function rollDice() {
  dice.forEach(function(die, index) {
    die.roll();
    $('.die:nth-child(' + (index+1) + ')').text(die.value);
  });
}


function Die(value) {
  var value = this.value;
}

Die.prototype.render = function() {
  $('.dice').append('<div class="die" id="die' + dice.length + '">0</div>');
}

Die.prototype.roll = function() {
  this.value = Math.floor((Math.random()*6)+1);
}


$(document).ready(function() {
  $(addDiceButton).on('click', addDice);
  $(rollDiceButton).on('click', rollDice);
});
