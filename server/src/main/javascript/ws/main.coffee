#http://habrahabr.ru/post/132728/
#https://github.com/liamcurry/backbone-schema or https://github.com/salsita/backbone-schema
#https://github.com/powmedia/backbone-forms

window.Backbone.sync = (method, model, options) ->
  console.log method
  console.log model
  console.log options


microtime = (get_as_float) ->
  # Returns either a string or a float containing the current time in seconds and microseconds
  # version: 812.316
  # discuss at: http://phpjs.org/functions/microtime
  # +   original by: Paulo Ricardo F. Santos
  # *     example 1: timeStamp = microtime(true);
  # *     results 1: timeStamp > 1000000000 && timeStamp < 2000000000
  now = new Date().getTime() / 1000
  s = parseInt(now)

  if get_as_float? then now else Math.round((now - s) * 1000) / 1000


socket = new WebSocket("ws://localhost:8080/WebSocketChat/anything") #second argument

timestart = 0

socket.onopen = (e) ->
  timestart = microtime(true)
  console.log(timestart)
  console.log("connection opened")
  socket.send("test connection to server")

socket.onmessage = (e) ->
  console.log(e);

socket.onclose = (e) ->
  console.log "connection closed: " + (microtime(true) - timestart)
  console.log(e);

###
Connections can then be closed using the WebSocket's
.close() method
###
#socket.close(); #easy!