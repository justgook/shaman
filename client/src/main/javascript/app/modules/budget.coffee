define [
  "app"
  "backbone"
],
(app, Backbone) ->
  Budget = app.module()
  Budget.Model = Backbone.Model.extend({});
  # Book Collection
  Budget.Collection = Backbone.Collection.extend({
  model: Budget.Model
  });

  class Budget.Views.Income extends Backbone.View
    template: "budget/income"
    el: "<div></div>"
    serialize: () =>
      alert "uraaa"


  class Budget.Views.List extends Backbone.View
    template: "budget/index"
    collection: new Budget.Collection
    addView: (model, render) =>
      # Insert a nested View into this View.
      view = @insertView new Budget.Views.Income({ model: model })
      alert "addView"
      # Only trigger render if it not inserted inside `beforeRender`.
      view.render() if (render != false)

    beforeRender: () ->
      alert "before render"
    #      @collection.each (model) ->
    #        this.addView({ model: model }, false)
    #       this)

    initialize: () =>
      @listenTo(@collection, "add", @addView);

    serialize: () =>
      alert "serialize BudgedViewList"
  Budget
