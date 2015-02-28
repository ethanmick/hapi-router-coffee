'use strict'

fs = require 'fs'
path = require 'path'
_ = require 'lodash'

exports.register = (server, options, next)->
  routes = []
  opts = options.routesOptions or {}

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
          routes.forEach (r)->
            _.merge(r, opts)
          routes = routes.concat(route)
        else if route isnt null and typeof route is 'object'
          for key, r of route
            _.merge(r, opts)
            routes.push(r)
      routes

  readRoutes(options.routesDir)
  server.route(routes)
  next()


exports.register.attributes =
  pkg: require '../package.json'
