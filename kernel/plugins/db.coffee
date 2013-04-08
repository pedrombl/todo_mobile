calatrava.db ?= {}

calatrava.db.store = (key, value) ->
  calatrava.bridge.plugins.call 'db', 'store',
    key: key
    value: JSON.stringify value

calatrava.db.get = (key, callback) ->
  callbackWrapper = (value) -> callback JSON.parse value
  callbackHandle = calatrava.bridge.plugins.rememberCallback(callbackWrapper)

  calatrava.bridge.plugins.call 'db', 'get',
    key: key
    getCallback: callbackHandle

calatrava.db.remove = (key) ->
  calatrava.bridge.plugins.call 'db', 'remove',
    key: key
