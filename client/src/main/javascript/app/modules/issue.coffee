define [
         "app"
         "backbone"
         "core/user"
       ],
       (app, Backbone, User) ->
         Issue = app.module()

         Issue.Model = Backbone.AssociatedModel.extend
           relations: [
             {
               type: Backbone.One
               key: 'executer'
               relatedModel: User.Model
             }
             {
               type: Backbone.One
               key: 'author'
               relatedModel: User.Model
             }
           ],
           defaults:
             title: ""
             priority: 0
             description:""
             executer: null
             author: null
             status: ""
             create: ""
             updated: ""

         Issue.Collection = Backbone.Collection.extend({
           model: Issue.Model
         });

         Issue.Views.Item = Backbone.View.extend
           template: "budget/income"
           model: Issue.Model
           el: "<tr></tr>"

         Issue.Views.List = Backbone.View.extend
           collection: Issue.Collection
           el: "<table></table>"

         Issue