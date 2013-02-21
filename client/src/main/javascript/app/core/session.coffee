#TODO think is this module required

define [
         "app"
         "backbone-associations"
       ],
       (app, Backbone) ->
         Session = app.module()
         Session.Model = Backbone.AssociatedModel.extend
           defaults:
             roles: []
             modules: []
         Session