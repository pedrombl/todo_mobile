calatrava.db ?= {}

calatrava.db.store = (key, value) ->
  calatrava.bridge.plugins.call 'db', 'store',
    key: key
    value: value

calatrava.db.get = (key) ->
  calatrava.bridge.plugins.call 'db', 'get',
    key: key

calatrava.db.remove = (key) ->
  calatrava.bridge.plugins.call 'db', 'remove',
    key: key
