class window.User extends Backbone.Model
  defaults:
    name: 'Unknown'
    privileges: 'Backbone'
  initialize: ->
    #@privileges = new Privileges
