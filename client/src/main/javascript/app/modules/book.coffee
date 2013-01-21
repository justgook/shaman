define [
    "app"
    "backbone"
  ],
  (app, Backbone) ->
        Book = app.module()

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
#        router = new Book.Router();
        # Book Model
        Book.Model = Backbone.Model.extend({});
        # Book Collection
        Book.Collection = Backbone.Collection.extend({
            model: Book.Model
        });
        # This will fetch the book template and render it.
#        Book.Views.Details = Backbone.View.extend (
#            template: "books/details",
#            render: (done) ->
#                view = this;
#                # Fetch the template, render it to the View element and call done.
#                namespace.fetchTemplate(this.template, (tmpl) ->
#                    view.el.innerHTML = tmpl(view.model.toJSON());
#                    done(view.el) if _.isFunction(done)
#                )
#        )

        class Book.Views.List extends Backbone.View
          template: "books/list"
          render: () =>
            console.log arguments
            @el.innerHTML = "test"

#            @el.innerHTML = "dasdsaddas"
#            console.log done({books:[]})
#            "dasdasdsad asdas d sa d"
#            console.log done
#            console.log @template
#            console.log namespace.fetchTemplate
#            namespace.fetchTemplate(@template, (tmpl) ->
#              view.el.innerHTML = tmpl(view.model.toJSON());
#              done(view.el) if _.isFunction(done)
#            )

        # Required, return the module for AMD compliance
        Book;

