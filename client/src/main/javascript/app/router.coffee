define [
  # Application.
  "app"
  "modules/book"
  "modules/budget"
],
(app, Book, Budget) ->
  #tempery data for test collection!
  TestCollection = new Budget.Collection ([
    {date: new Date(2013, 2, 5).getTime(), balance: 10},
    {date: new Date(2013, 2, 6).getTime(), balance: -10},
    {date: new Date(2013, 2, 7).getTime(), balance: 45},
    {date: new Date(2013, 2, 4).getTime(), balance: -120}
  ])
  #    console.log app.useLayout(Book)
  # Defining the application router, you can attach sub routers here.
  Backbone.Router.extend
    routes:
      "": "index"
      "test": "index_test"
    index: () ->
      view = new Budget.Views.List {el: "#main", collection: TestCollection}
      view.render()