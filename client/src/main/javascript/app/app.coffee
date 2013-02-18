#global Backbone
define [
  "mustache"
  "backbone.layoutmanager"
],
(Mustache, Backbone) ->
#  console.log(LayoutManager)
#  Backbone.LayoutManager = LayoutManager

  # Provide a global location to place configuration settings and module
  # creation.
  app =
  # The root path to run the application.
    root: "/"

  # Localize or create a new JavaScript Template object.
  JST = window.JST || {};

  # Configure LayoutManager with Backbone Boilerplate defaults.
  Backbone.Layout.configure
  # Allow LayoutManager to augment Backbone.View.prototype.
    manage: true
    el: true
    prefix: "themes/metro/templates/"
    fetch: (path) ->
      # Concatenate the file extension.
      path = path + ".jade"

      # If cached, use the compiled template.
      return JST[path] if JST[path]

      # Put fetch into `async-mode`.
      done = @async()

      # Seek out the template asynchronously.
      $.get app.root + path,
      (contents) ->
        done(JST[path] = Mustache.compile(contents))
      , "text"

  # Mix Backbone.Events, modules, and layout management into the app object.
  return _.extend app,
  # Create a custom object with a nested Views object.
    module: (additionalProps) ->
      _.extend({ Views:
        {} }, additionalProps)
  , Backbone.Events
