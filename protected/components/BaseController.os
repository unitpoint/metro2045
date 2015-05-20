BaseController = extends Controller {
	pageTitle = "Metro2035 game concept",
	
	pageAuthor = "Evgeniy Golovin",
	
	pageDesc = <<<END'
Metro 2035 концепт многопользовательской стратегической браузерной игры
END,
	
	pageKeywords = "Metro 2035 концепт многопользовательской стратегической браузерной игры",
	
	init = function(){
		super()
		header("Expires: "..(DateTime.now()-1).format("R"))
		header("Last-Modified: "..(DateTime.now()-2).format("R"))
	},
}