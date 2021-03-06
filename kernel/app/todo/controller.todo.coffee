ToDo = ({ views, changePage, ajax, ToDos }) ->
  toDoList = views.toDoList

  toDoList.bind 'addNewToDo', ->
    toDoList.get 'newToDoText', (description) ->
      ToDos.create description: description
      renderAll()

  toDoList.bind 'checked', (json) ->
    todo = JSON.parse json
    todo.isDone = !todo.isDone
    ToDos.update todo
    renderAll()

  toDoList.bind 'remove', (json) ->
    todo = JSON.parse json
    ToDos.remove todo
    renderAll()

  toDoList.bind 'pageOpened', ->
    ToDos.loadAll (todos) ->
      renderAll(todos)

  renderAll = (todos) ->
    toDoList.render 
      toDos: todos || ToDos.all

app ?= {}
app.controller ?= {}
app.controller.toDo = ToDo
