exports = require 'spec_helper'
ToDos = exports.app.model.toDos

describe 'Todo', ->
  subject = null

  beforeEach ->
    subject = ToDos() 

  it 'should be created', ->
    subject.create description: 'Create a calatrava app'
    expect(subject.all.length).toBe 1
    expect(subject.all[0].id).toBe 1
    expect(subject.all[0].description).toBe 'Create a calatrava app'

  describe 'A existing todo', ->
    beforeEach ->
      subject.create description: 'Create a calatrava app'

    it 'should be updated', ->
      subject.update id: 1, description: 'Update a calatrava app'
      expect(subject.all.length).toBe 1
      expect(subject.all[0].description).toBe 'Update a calatrava app'

    it 'should not be updated if id not exists', ->
      subject.update id: 6, description: 'Update a calatrava app'
      expect(subject.all.length).toBe 1
      expect(subject.all[0].description).toBe 'Create a calatrava app'

    it 'should be deleted', ->
      subject.remove id: 1
      expect(subject.all.length).toBe 0

    it 'should not be deleted if id not exists', ->
      subject.remove id: 5
      expect(subject.all.length).toBe 1
