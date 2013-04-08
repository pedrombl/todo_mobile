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

  renderAll = ->
    toDoList.render 
      toDos: ToDos.all

  renderAll()

app ?= {}
app.controller ?= {}
app.controller.toDo = ToDo
