exports = require 'spec_helper'
stubView = exports.stubView
ToDo = exports.app.controller.toDo

describe 'Todo Controller', ->
  subject = toDoList = ToDos = null

  beforeEach ->
    ToDos = 
      all: [ description: 'Teste' ]
      create: (todo) ->

    toDoList = stubView.create 'todoListView'
      
    subject = ToDo 
      views: 
        toDoList: toDoList
      ToDos: ToDos

  it 'should bind addNewToDo event', ->
    expect(toDoList.boundEvents['addNewToDo']).not.toBeUndefined()

  it 'should render the todo list', ->
    expect(toDoList.render).toHaveBeenCalledWith
      toDos: [ description: 'Teste' ]

  it 'should create a new ToDo on addNewToDo event', ->
    spyOn(ToDos, 'create')

    toDoList.fieldContains 'newToDoText', 'Teste'
    toDoList.trigger 'addNewToDo'

    expect(ToDos.create).toHaveBeenCalledWith description: 'Teste'
    expect(toDoList.render).toHaveBeenCalled

