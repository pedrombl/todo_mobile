(function() {

  if (typeof app === "undefined" || app === null) app = {};

  if (app.toDo == null) app.toDo = {};

  app.toDo.start = function() {
    app.controller.toDo({
      views: {
        toDoList: calatrava.bridge.pages.pageNamed("toDoList")
      },
      changePage: calatrava.bridge.changePage,
      ajax: calatrava.bridge.request,
      ToDos: app.model.toDos()
    });
    return calatrava.bridge.changePage("toDoList");
  };

}).call(this);
