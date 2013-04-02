calatrava.pageView ?= {}

calatrava.pageView.toDoList = ->

  $page = $('#toDoListView')
  $p = (sel)-> $('#' + sel, $page)

  checked = remove = null

  bind = (event, handler) ->
    switch event
      when 'checked' then checked = handler
      when 'remove' then remove = handler
      else $p(event).off('click').on 'click', handler

  get = (field) ->
    $p(field).val()

  render = (message) ->
    renderSection(section, data) for own section, data of message

  renderSection = (key, data) ->
    switch key
      when 'toDos' then renderToDos data
      else $p(key).html data

  renderToDos = (todos) ->
    $p('toDoList').find('div').remove()
    $p('toDoList').append rowFor(todo) for todo in todos

  rowFor = (todo) ->
    checkbox = $('<input type="checkbox" />')
    $(checkbox).on 'click', -> checked todo, !todo.isDone
    if todo.isDone then checkbox.prop 'checked', true

    removeLink = $('<a href="javascript:void(0);">x</a>')
    removeLink.on 'click', -> remove todo

    container = $('<div></div>')
    container.append checkbox
    container.append todo.description 
    container.append " - " 
    container.append removeLink
    container

  bind: bind
  render: render
  get: get
  show: ->
  hide: ->
