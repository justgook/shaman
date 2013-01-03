#http://habrahabr.ru/post/132728/
Backbone.sync = (method, model, options) ->

#  # Сливаем методы дубовым способом
#  method = (method=='update' or method=='create')?'save':method;
#  # Прерываем старый запрос
#  if(model.loading && model.loading.method == method) {
#  model.loading.xhr.abort();
#  }
#  app.log('Запрос на "'+model.url(method)+'"');
#  var xhr = $.ajax({
#  type: 'POST',
#  url: model.url(method),
#  data: (model instanceof Backbone.Model)?model.toJSON():{},
#  success: function(ret) {
#  # Проверка наличия ошибки
#  if(ret.is_error) {
#  app.log('Ошибка запроса');
#  } else {
#  app.log('Запрос завершен');
#  (function(data){
#  app.log('Backbone.sync получил данные:', data);
#  if(data.res) {
#  # Ответ - строка, вместо записей
#            model.trigger('load:res', data.res);
#  } else {
#  # Ответ - записи, либо данные
#  options.success(data.rows?data.rows:data);
#  }
#  model.trigger((method=='save')?'save':'load', data);
#  })(ret.data);
#  }
#  },
#  error: function (req_obj, msg, error) {
#  app.log('Ошибка запроса');
#  },
#  dataType: 'json'
#  });
#  # Сохраняем ссылку на запрос в модель
#  model.loading = {
#  method: method,
#  xhr: xhr
#  }
