LocalStorageDb = ->
  store = (key, value) ->
    localStorage[key] = JSON.stringify value

  get = (key, callback) ->
    value = localStorage[key]
    calatrava.bridge.runtime.invokePluginCallback(callback, JSON.parse value) if value

  remove = (key) ->
    localStorage.removeItem key

  store: store
  get: get
  remove: remove

calatrava.web ?= {}
calatrava.web.db = ( -> 
  db = LocalStorageDb()
  (method, {key, value, callback}) -> 
    switch method
      when 'store' then db.store key, value
      when 'get' then db.get key, callback
      when 'remove' then db.remove key
)()

calatrava.bridge.runtime.registerPlugin 'db', calatrava.web.db
