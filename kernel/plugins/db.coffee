calatrava.db ?= {}

calatrava.db.store = (key, value) ->
  calatrava.bridge.plugins.call 'db', 'store',
    key: key
    value: value

calatrava.db.get = (key, callback) ->
  callbackHandle = calatrava.bridge.plugins.rememberCallback(callback)
  calatrava.bridge.plugins.call 'db', 'get',
    key: key
    callback: callbackHandle

calatrava.db.remove = (key) ->
  calatrava.bridge.plugins.call 'db', 'remove',
    key: key
