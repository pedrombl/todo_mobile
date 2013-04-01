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

  ToDos = function(db) {
    var all, create, find, idSequence, persist, remove, update;
    idSequence = db.idSequence != null ? JSON.parse(db.idSequence) : 0;
    all = db.allToDos != null ? JSON.parse(db.allToDos) : [];
    create = function(todo) {
      all.push(ToDo(++idSequence, todo.description, todo.isDone));
      return persist();
    };
    update = function(todo) {
      var actual;
      actual = find(todo);
      if (!(actual != null)) return;
      actual.description = todo.description;
      actual.isDone = todo.isDone;
      return persist();
    };
    remove = function(todo) {
      var actual;
      actual = find(todo);
      if (actual != null) all.splice(all.indexOf(actual), 1);
      return persist();
    };
    find = function(todo) {
      return _.find(all, function(elem) {
        return elem.id === todo.id;
      });
    };
    persist = function() {
      return db.allToDos = JSON.stringify(all);
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
