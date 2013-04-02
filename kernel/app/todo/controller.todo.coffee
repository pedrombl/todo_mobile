ToDo = ({ views, changePage, ajax, ToDos }) ->
  toDoList = views.toDoList

  toDoList.bind 'addNewToDo', ->
    toDoList.get 'newToDoText', (description) ->
      ToDos.create description: description
      renderAll()

  toDoList.bind 'checked', (todo, checked) ->
    todo.isDone = checked
    ToDos.update todo
    renderAll()

  toDoList.bind 'remove', (todo) ->
    ToDos.remove todo
    renderAll()

  renderAll = ->
    toDoList.render 
      toDos: ToDos.all

  renderAll()

app ?= {}
app.controller ?= {}
app.controller.toDo = ToDo
