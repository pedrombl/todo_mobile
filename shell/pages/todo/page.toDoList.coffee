calatrava.pageView ?= {}

calatrava.pageView.toDoList = ->

  $page = $('#toDoListView')
  $p = (sel)-> $('#' + sel, $page)

  bind = (event, handler) ->
    console.log "Binding event #{event}"
    $p(event).click handler

  get = (field) ->
    console.log "Getting value of #{field}"
    $p(field).val()

  render = (message) ->
    console.log "Rendering message #{JSON.stringify(message)}"
    renderSection(section, data) for own section, data of message

  renderSection = (key, data) ->
    switch key
      when 'toDos' then renderToDos data
      else $p(key).html data

  renderToDos = (todos) ->
    $p('toDoList').find('tr').remove()
    $p('toDoList').append rowFor(todo) for todo in todos

  rowFor = (todo) ->
    "<tr>
      <td>#{todo.description}</td>
      <td>#{todo.isDone}</td>
      <td></td>
    </tr>"

  bind: bind
  render: render
  get: get
  show: ->
  hide: ->
