ToDo = (id, description, isDone = false) ->
  id: id
  description: description
  isDone: isDone

ToDos = (db) ->
  idSequence = if db.idSequence? then JSON.parse db.idSequence else 0
  all = if db.allToDos? then JSON.parse db.allToDos else []

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
    db.allToDos = JSON.stringify all

  all: all
  create: create
  update: update
  remove: remove

app.model ?= {}
app.model.toDos = ToDos
