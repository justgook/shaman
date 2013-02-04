define [
  # Application.
  "app"
  "modules/book"
  "modules/budget"
],
(app, Book, Budget) ->
  #tempery data for test collection!
  Library = new Book.Collection ([
    { id: 1, title: "A Tale of Two Cities", author: "Charles Dickens", published: 1859 },
    { id: 2, title: "The Lord of the Rings", author: "J. R. R. Tolkien", published: 1954 },
    { id: 3, title: "The Hobbit", author: "J. R. R. Tolkien", published: 1937 },
    { id: 4, title: "And Then There Were None", author: "Agatha Christie", published: 1939 }
  ])
  #    console.log app.useLayout(Book)
  # Defining the application router, you can attach sub routers here.
  Backbone.Router.extend
    routes:
      "": "index"
      "test": "index_test"
    index: () ->
      view = new Budget.Views.List {el: "#main", collection: Library}
      view.render()
    index_test: () ->
      #        console.log Library
      #        console.log Book
      view = new Book.Views.List {el: "#main", collection: Library}
      #        console.log view
      view.render()
#          console.log el
#        console.log view
#        view.render()
#         view.render "test1234567890"
#        view.render (el) ->
#          alert "dsadsa"
#          $("#main").html(el)
