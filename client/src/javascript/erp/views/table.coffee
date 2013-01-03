class TableView extends Backbone.View

  el: $ 'body'

  initialize: ->
    _.bindAll @
    @render()

  events:
    'click button': 'addItem'

  render: ->
    $(@el).append '<button>Add List Item</button>'
    $(@el).append '<ul></ul>'
