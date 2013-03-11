exports = require 'spec_helper'
Todos = exports.app.model.todos

describe 'Todo', ->
  todos = null

  beforeEach ->
    todos = Todos()

  it 'should be created', ->
    todos.create description: 'Create a calatrava app'
    expect(todos.all.length).toBe 1
    expect(todos.all[0].id).toBe 1
    expect(todos.all[0].description).toBe 'Create a calatrava app'

  describe 'A existing todo', ->
    beforeEach ->
      todos.create description: 'Create a calatrava app'

    it 'should be updated', ->
      todos.update id: 1, description: 'Update a calatrava app'
      expect(todos.all.length).toBe 1
      expect(todos.all[0].description).toBe 'Update a calatrava app'

    it 'should not be updated if id not exists', ->
      todos.update id: 6, description: 'Update a calatrava app'
      expect(todos.all.length).toBe 1
      expect(todos.all[0].description).toBe 'Create a calatrava app'

    it 'should be deleted', ->
      todos.remove id: 1
      expect(todos.all.length).toBe 0

    it 'should not be deleted if id not exists', ->
      todos.remove id: 5
      expect(todos.all.length).toBe 1
