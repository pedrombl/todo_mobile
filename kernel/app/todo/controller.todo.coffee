ToDo = ({ views, changePage, ajax, ToDos }) ->
  toDoList = views.toDoList

  toDoList.bind 'addNewToDo', ->
    toDoList.get 'newToDoText', (description) ->
      ToDos.create description: description
      renderAll()

  renderAll = () ->
    toDoList.render 
      toDos: ToDos.all

  renderAll()

app ?= {}
app.controller ?= {}
app.controller.toDo = ToDo
