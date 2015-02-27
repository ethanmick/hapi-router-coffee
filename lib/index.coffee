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
      else
        if path.extname(file) is '.js' or path.extname(file) is '.coffee'
          route = require(filePath)
          routes = routes.concat(route)
      routes

  readRoutes(options.routesDir)
  server.route(routes)
  next()


exports.register.attributes =
  pkg: require '../package.json'
