ToDo = (id, description, isDone = false) ->
  id: id
  description: description
  isDone: isDone

ToDos = () ->
  idSequence = 0
  all = []

  create = (todo) ->
    all.push ToDo(++idSequence, todo.description, todo.isDone)

  update = (todo) ->
    actual = find todo
    return if not actual?

    actual.description = todo.description
    actual.isDone = todo.isDone

  remove = (todo) -> 
    actual = find todo
    all.splice all.indexOf(actual), 1  if actual?
	
  find = (todo) -> 
    _.find all, (elem) -> elem.id == todo.id

  all: all
  create: create
  update: update
  remove: remove

app.model ?= {}
app.model.toDos = ToDos
