define [
    "namespace"
    "use!backbone"
  ],
  (namespace, Backbone) ->
        Book = namespace.module();
        # Router
        Book.Router = Backbone.Router.extend {
            routes:
                "book/:p"   : "details",
            details: (hash) ->
                view = new Book.Views.Details({model: Library.get(hash)});
                view.render (el) ->
                    $("#main").html el
        }
        # Instantiate Router
        router = new Book.Router();
        # Book Model
        Book.Model = Backbone.Model.extend({});
        # Book Collection
        Book.Collection = Backbone.Collection.extend({
            model: Book.Model
        });
        # This will fetch the book template and render it.
        Book.Views.Details = Backbone.View.extend (
            template: "app/templates/books/details.html",
            render: (done) ->
                view = this;
                # Fetch the template, render it to the View element and call done.
                namespace.fetchTemplate(this.template, (tmpl) ->
                    view.el.innerHTML = tmpl(view.model.toJSON());
                    done(view.el) if _.isFunction(done)
                )
        )
        # This will fetch the book list template and render it.
        Book.Views.List = Backbone.View.extend({
            template: "app/templates/books/list.html",
            render: (done) ->
                view = this;
                namespace.fetchTemplate(this.template, (tmpl) ->
                    view.el.innerHTML = tmpl({books: view.collection.toJSON()})
                    done(view.el) if _.isFunction(done)
                );
        })
        # Required, return the module for AMD compliance
        Book;

