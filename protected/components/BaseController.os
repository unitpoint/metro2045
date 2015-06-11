BaseController = extends Controller {
	pageTitle = "Metro2045 game concept",
	
	pageAuthor = "Evgeniy Golovin",
	
	pageDesc = <<<END'
Metro 2035 концепт многопользовательской стратегической браузерной игры
END,
	
	pageKeywords = "Metro 2045 концепт многопользовательской стратегической браузерной игры",
	
	init = function(){
		super()

		var data = app.session.data
		data.time = DateTime.now()
		data.counter = (data.counter || 0) + 1
		
		header("Expires: "..(DateTime.now()-1).format("R"))
		header("Last-Modified: "..(DateTime.now()-2).format("R"))
	},
}