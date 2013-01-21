#global Backbone
define [
  "backbone.layoutmanager"
  # Include additional libraries installed with JamJS or placed in the
  # `vendor/js` directory, here.
  ],

  () ->
    # Provide a global location to place configuration settings and module
    # creation.
    app =
      # The root path to run the application.
      root: "/"

    # Localize or create a new JavaScript Template object.
    JST = window.JST = window.JST || {};

    # Configure LayoutManager with Backbone Boilerplate defaults.
    Backbone.LayoutManager.configure
      # Allow LayoutManager to augment Backbone.View.prototype.
      manage: true
      prefix: "themes/metro/templates/"
      fetch: (path) ->
        # Concatenate the file extension.
        path = path + ".html"

        # If cached, use the compiled template.
        return JST[path] if JST[path]

        # Put fetch into `async-mode`.
        done = @async()

        # Seek out the template asynchronously.
        $.get app.root + path, (contents) ->
          done(JST[path] = _.template(contents))

    # Mix Backbone.Events, modules, and layout management into the app object.
    return _.extend app,
      # Create a custom object with a nested Views object.
      module: (additionalProps) ->
        _.extend({ Views: {} }, additionalProps)


      # Helper for using layouts.
      useLayout: (name, options) ->
        # Enable variable arity by allowing the first argument to be the options
        # object and omitting the name argument.
        options = if _.isObject(name) then name else {}

        # If a name property was specified use that as the template.
        options.template = name if _.isString(name)

        # Check if a layout already exists, if so, update the template.
        if @layout
          @layout.template = options.template
        else
          # Create a new Layout with options.
          @layout = new Backbone.Layout _.extend({el: "#main"}, options)
        # Cache the refererence.
        @layout
    , Backbone.Events
