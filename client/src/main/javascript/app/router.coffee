define [
    # Application.
    "app"
    "modules/book"
],
  (app, Book) ->
    window.Library = new Book.Collection ([
      { id: 1, title: "A Tale of Two Cities", author: "Charles Dickens", published: 1859 },
      { id: 2, title: "The Lord of the Rings", author: "J. R. R. Tolkien", published: 1954 },
      { id: 3, title: "The Hobbit", author: "J. R. R. Tolkien", published: 1937 },
      { id: 4, title: "And Then There Were None", author: "Agatha Christie", published: 1939 }
    ])
    # Defining the application router, you can attach sub routers here.
    Router = Backbone.Router.extend
      routes:
        "": "index"
      index: () ->
        view = new Book.Views.List {collection: Library}
        view.render (el) ->
          $("#main").html(el);
