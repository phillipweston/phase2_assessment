$(document).ready(function() {
  var todoTemplate = $.trim($('#todo_template').html());

  function bindEvents() {
    $('button').on('click', function(){
      addTodo(buildTodo($('.todo').val()));
    });

    $('.todo_list').on('click', function(todo) {
      
      var clickedAction = todo.target.className;
      var clickedTodo = $(todo.target).closest('.todo');

      switch(clickedAction) {
        case 'delete':
          removeTodo(clickedTodo);          
          break;
        case 'complete':
          completeTodo(clickedTodo);
          break;
      }
    });
  }

  function addTodo(DOMElement) {
    $('.todo_list').append(DOMElement);
  }

  function removeTodo(DOMElement) {
    DOMElement.remove();
  }

  function completeTodo(DOMElement) {
    DOMElement.addClass('complete');
  }

  function buildTodo(todoName) {
    var $todo = $(todoTemplate);
    $todo.find('h2').text(todoName);
    return $todo;
  }
  
  bindEvents();
});
