#require
#  # Initialize the application with the main application file
#  deps: ["require.config", "main"]
require.config
  baseUrl: "/javascript"
  paths:
    {
    app: "app/app"
    core: "app/core"
    router: "app/router"
    modules: "app/modules"
    noext: "vendor/requirejs-plugins/noext" #alias to plugin
    jquery: "vendor/jquery.1.9.0"
    backbone: "vendor/backbone"
    underscore: "vendor/lodash.underscore"
    'backbone.layoutmanager': "vendor/backbone.layoutmanager"
    'backbone-associations': "vendor/backbone-associations"
    mustache: "vendor/mustache.js/mustache"
    }
  shim:
    {
    backbone:
      {
      deps: ["jquery", "underscore"]
      exports: "Backbone"
      }
    "backbone.layoutmanager":
      {
      deps: ["backbone"]
      exports: "Backbone"
      }
    "backbone-associations":
      {
      deps: ["backbone"]
      exports: "Backbone"
      }

    }
