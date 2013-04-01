(function() {
  var ToDo, ToDos;

  ToDo = function(id, description, isDone) {
    if (isDone == null) isDone = false;
    return {
      id: id,
      description: description,
      isDone: isDone
    };
  };

  ToDos = function() {
    var all, create, find, idSequence, remove, update;
    idSequence = 0;
    all = [];
    create = function(todo) {
      return all.push(ToDo(++idSequence, todo.description, todo.isDone));
    };
    update = function(todo) {
      var actual;
      actual = find(todo);
      if (!(actual != null)) return;
      actual.description = todo.description;
      return actual.isDone = todo.isDone;
    };
    remove = function(todo) {
      var actual;
      actual = find(todo);
      if (actual != null) return all.splice(all.indexOf(actual), 1);
    };
    find = function(todo) {
      return _.find(all, function(elem) {
        return elem.id === todo.id;
      });
    };
    return {
      all: all,
      create: create,
      update: update,
      remove: remove
    };
  };

  if (app.model == null) app.model = {};

  app.model.toDos = ToDos;

}).call(this);
