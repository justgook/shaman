require.config
  baseUrl: "/src/main/javascript"
  paths: {
    test:"/src/test/javascript"
  }
require ["noext!test/date.coffee"], () ->
	jasmine.getEnv().addReporter(new jasmine.HtmlReporter());
	jasmine.getEnv().execute();