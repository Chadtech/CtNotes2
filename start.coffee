express = require 'express'
http = require 'http'
{join} = require 'path'

PORT = Number process.env.PORT or 8085

app = express()
app.use express.static join __dirname, 'public'

app.use (err, request, response, next) ->
  console.error err.stack
  response.send 500, 'SOMETHING BROKE'

app.get '/*', (request, response) ->
  idxFile = join __dirname, 'public/index.html'
  response.status 200
    .sendFile idxFile

httpServer = http.createServer app

httpServer.listen PORT, ->
  console.log 'info', 'SERVER RUNNING ON ' + PORT