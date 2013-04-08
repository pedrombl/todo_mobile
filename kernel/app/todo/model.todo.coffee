ToDo = (id, description, isDone = false) ->
  id: id
  description: description
  isDone: isDone

ToDos = (db) ->

  idSequence = db.get('idSequence') || 0
  all = db.get('todos') || []

  create = (todo) ->
    all.push ToDo(++idSequence, todo.description, todo.isDone)
    persist()

  update = (todo) ->
    actual = find todo
    return if not actual?

    actual.description = todo.description
    actual.isDone = todo.isDone
    persist()

  remove = (todo) -> 
    actual = find todo
    all.splice all.indexOf(actual), 1  if actual?
    persist()
	
  find = (todo) -> 
    _.find all, (elem) -> elem.id == todo.id

  persist = ->
    db.store 'idSequence', idSequence
    db.store 'todos', all

  all: all
  create: create
  update: update
  remove: remove

app.model ?= {}
app.model.toDos = ToDos
