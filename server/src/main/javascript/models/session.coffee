class window.Session extends Backbone.Model
  defaults:
    user: null

  initialize: ->
    @user = new User

window.session = new Session