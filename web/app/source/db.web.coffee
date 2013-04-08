LocalStorageDb = ->
  store = (key, value) ->
    localStorage[key] = JSON.stringify value

  get = (key) ->
    value = localStorage[key]
    JSON.parse value if value

  remove = (key) ->
    localStorage.removeItem key

  store: store
  get: get
  remove: remove

calatrava.web ?= {}
calatrava.web.db = ( -> 
  db = LocalStorageDb()
  (method, {key, value}) -> db[method] key, value
)()

calatrava.bridge.runtime.registerPlugin 'db', calatrava.web.db
