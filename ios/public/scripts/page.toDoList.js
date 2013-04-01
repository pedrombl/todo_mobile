(function() {
  var __hasProp = Object.prototype.hasOwnProperty;

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.toDoList = function() {
    var $p, $page, bind, get, render, renderSection, renderToDos, rowFor;
    $page = $('#toDoListView');
    $p = function(sel) {
      return $('#' + sel, $page);
    };
    bind = function(event, handler) {
      console.log("Binding event " + event);
      return $p(event).click(handler);
    };
    get = function(field) {
      console.log("Getting value of " + field);
      return $p(field).val();
    };
    render = function(message) {
      var data, section, _results;
      console.log("Rendering message " + (JSON.stringify(message)));
      _results = [];
      for (section in message) {
        if (!__hasProp.call(message, section)) continue;
        data = message[section];
        _results.push(renderSection(section, data));
      }
      return _results;
    };
    renderSection = function(key, data) {
      switch (key) {
        case 'toDos':
          return renderToDos(data);
        default:
          return $p(key).html(data);
      }
    };
    renderToDos = function(todos) {
      var todo, _i, _len, _results;
      $p('toDoList').find('tr').remove();
      _results = [];
      for (_i = 0, _len = todos.length; _i < _len; _i++) {
        todo = todos[_i];
        _results.push($p('toDoList').append(rowFor(todo)));
      }
      return _results;
    };
    rowFor = function(todo) {
      return "<tr>      <td>" + todo.description + "</td>      <td>" + todo.isDone + "</td>      <td></td>    </tr>";
    };
    return {
      bind: bind,
      render: render,
      get: get,
      show: function() {},
      hide: function() {}
    };
  };

}).call(this);
