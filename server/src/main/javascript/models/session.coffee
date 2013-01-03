class Session extends Backbone.Model
  defaults:
    user: null

  initialize: ->
    @user = new User
