define [
  "app"
  "backbone-associations"
],
(app, Backbone) ->
  User = app.module()
  User.Model = Backbone.extend({
    defaults:
      name:""
      surname:""
      skype:""
      role:null
                               })
  User.Role = app.module();
  User
#
#  Budget = app.module()
#  Budget.Model = Backbone.Model.extend({
#  defaults:
#    balance: 0
#    type: "test_type"
#    date: 0
#  #    new Date(unix_timestamp*1000);
#  });
#  # Book Collection
#  Budget.Collection = Backbone.Collection.extend({
#    model: Budget.Model
#  });
#
#  class Budget.Views.Income extends Backbone.View
#    template: "budget/income"
#    model: Budget.Model
#    el: "<tr></tr>"
#    serialize: () =>
#      num = 0
#      model = @model.toJSON();
#      model.thisCol = () ->
#        num == 3
#      #TODO use date Module
#      model.drawRow = () ->
#        (text, render) ->
#          (render(text) for num in [1..7])
#      model
#
#
#  class Budget.Views.List extends Backbone.View
#    template: "budget/index"
#    collection: Budget.Collection
#    #    events:
#    #      "click .icon":          "open"
#    #      "click .button.edit":   "openEditDialog"
#    #      "click .button.delete": "destroy"
#
#    addView: (model, render) =>
#      # Insert a nested View into this View.
#      view = @insertView 'tbody', new Budget.Views.Income({ model: model })
#      #alert "addView"
#      # Only trigger render if it not inserted inside `beforeRender`.
#      view.render() if (render != false)
#
#    beforeRender: () ->
#      @collection.each (model) =>
#        @addView(model, false)
#
#    initialize: () =>
#      @listenTo(@collection, "add", @addView);
#
#    serialize: () =>
#      #TODO Move to date Module
#      today = new Date()
#      #      today.setFullYear(2013, 1, 14)
#      first =  1 - (today.getDay() || 7)
#      currDate = new Date()
#      week = (new Date(currDate.setDate(today.getDate() + num)) for num in [first..6 + first])
#      return {
#      #TODO impliment date Module
#      week: week
#      curentDay: () ->
#        #TODO impliment date formating MODEL
#        "#{dateFormat.dayNames[@getDay()]} #{@getDate()}.#{(@getMonth() + 1)}.#{@getFullYear()}"
#      }
#  #      alert "serialize BudgedViewList"
#  Budget
