LocalStorageDb = ->
  store = (key, value) ->
    localStorage[key] = value

  get = (key, callback) ->
    value = localStorage[key]
    calatrava.bridge.runtime.invokePluginCallback(callback, value) if value

  remove = (key) ->
    localStorage.removeItem key

  store: store
  get: get
  remove: remove

calatrava.web ?= {}
calatrava.web.db = ( -> 
  db = LocalStorageDb()
  (method, {key, value, getCallback}) -> 
    switch method
      when 'get' then db.get key, getCallback
      else db[method](key, value)
)()

calatrava.bridge.runtime.registerPlugin 'db', calatrava.web.db
