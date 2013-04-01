(function() {
  var ToDo;

  ToDo = function(_arg) {
    var ToDos, ajax, changePage, renderAll, toDoList, views;
    views = _arg.views, changePage = _arg.changePage, ajax = _arg.ajax, ToDos = _arg.ToDos;
    toDoList = views.toDoList;
    toDoList.bind('addNewToDo', function() {
      return toDoList.get('newToDoText', function(description) {
        ToDos.create({
          description: description
        });
        return renderAll();
      });
    });
    renderAll = function() {
      return toDoList.render({
        toDos: ToDos.all
      });
    };
    return renderAll();
  };

  if (typeof app === "undefined" || app === null) app = {};

  if (app.controller == null) app.controller = {};

  app.controller.toDo = ToDo;

}).call(this);
