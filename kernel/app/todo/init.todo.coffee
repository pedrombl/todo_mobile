app ?= {}
app.toDo ?= {}

app.toDo.start = ->
  app.controller.toDo
    views:
      toDoList: calatrava.bridge.pages.pageNamed "toDoList"
    changePage: calatrava.bridge.changePage
    ajax: calatrava.bridge.request
    ToDos: app.model.toDos()

  calatrava.bridge.changePage "toDoList"
