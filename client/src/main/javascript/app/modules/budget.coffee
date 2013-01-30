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
    render: () =>
      template = arguments[0]
      @$el.innerHTML = template()


  class Budget.Views.List extends Backbone.View
    template: "budget/index"
    render: () =>
      #        item.render()
      #        console.log item.template
      template = arguments[0]
      testData =
        "beatles": [
          { "firstName": "John", "lastName": "Lennon" },
          { "firstName": "Paul", "lastName": "McCartney" },
          { "firstName": "George", "lastName": "Harrison" },
          { "firstName": "Ringo", "lastName": "Starr" }
        ],
        "name": () ->
          this.firstName + " " + this.lastName
        "test": false
      console.log testData.name
      @el.innerHTML = template(testData)

  Budget
