'use strict'

fs = require 'fs'
path = require 'path'

exports.register = (server, options, next)->
  routes = []

  readRoutes = (dir)->
    fs.readdirSync(dir).forEach (file)->
      filePath = path.join(dir, file)
      stat = fs.statSync(filePath)
      if stat and stat.isDirectory()
        return readRoutes(filePath)
      ext = path.extname(file)
      if ext is '.js' or ext is '.coffee'
        route = require(filePath)
        if Array.isArray(route)
          routes = routes.concat(route)
        else if route isnt null and typeof route is 'object'
          routes.push(r) for key, r of route
      routes

  readRoutes(options.routesDir)
  server.route(routes)
  next()


exports.register.attributes =
  pkg: require '../package.json'
