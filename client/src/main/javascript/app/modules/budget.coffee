define [
         "app"
         "backbone"
         "modules/date"
       ],
       (app, Backbone, DateHelper) ->
         pupertest = new DateHelper()
         pupertest.week().next()
         #http://blog.stevenlevithan.com/archives/date-time-format
         dateFormat = {
         dayNames: [
           "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
           "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
         ],
         monthNames: [
           "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
           "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November",
           "December"
         ]
         };

         #  Build model of callendar with incrementable date funcion, i18n date formating, ETC.

         Budget = app.module()
         Budget.Model = Backbone.Model.extend({
                                              defaults:
                                                balance: 0
                                                type: "test_type"
                                                date: 0
                                              #    new Date(unix_timestamp*1000);
                                              });
         # Book Collection
         Budget.Collection = Backbone.Collection.extend({
                                                        model: Budget.Model
                                                        });

         class Budget.Views.Income extends Backbone.View
           template: "budget/income"
           model: Budget.Model
           el: "<tr></tr>"
           serialize: () =>
             num = 0
             model = @model.toJSON();
             model.thisCol = () ->
               num == 3
             #TODO use date Module
             model.drawRow = () ->
               (text, render) ->
                 (render(text) for num in [1..7])
             model


         class Budget.Views.List extends Backbone.View
           template: "budget/index"
           collection: Budget.Collection
           #    events:
           #      "click .icon":          "open"
           #      "click .button.edit":   "openEditDialog"
           #      "click .button.delete": "destroy"

           addView: (model, render) =>
             # Insert a nested View into this View.
             view = @insertView 'tbody', new Budget.Views.Income({ model: model })
             #alert "addView"
             # Only trigger render if it not inserted inside `beforeRender`.
             view.render() if (render != false)

           beforeRender: () ->
             @collection.each (model) =>
               @addView(model, false)

           initialize: () =>
             @listenTo(@collection, "add", @addView);

           serialize: () =>
             #TODO Move to date Module
             today = new Date()
             #      today.setFullYear(2013, 1, 14)
             first =  1 - (today.getDay() || 7)
             currDate = new Date()
             week = (new Date(currDate.setDate(today.getDate() + num)) for num in [first..6 + first])
             return {
             #TODO impliment date Module
             week: week
             curentDay: () ->
               #TODO impliment date formating MODEL
               "#{dateFormat.dayNames[@getDay()]} #{@getDate()}.#{(@getMonth() + 1)}.#{@getFullYear()}"
             }
         #      alert "serialize BudgedViewList"
         Budget
