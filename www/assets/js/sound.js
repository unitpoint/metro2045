function setupSoundManager(params){
	var defaultOptions = params.defaultOptions;
	delete params.defaultOptions;
	
	params = $.extend({
		url: 'assets/soundmanager2/swf',
		flashVersion: 9,
		preferFlash: false, // prefer 100% HTML5 mode, where both supported
	}, params);
	
	params.defaultOptions = $.extend(defaultOptions, {
			// set global default volume for all sound objects
			volume: 33
	}, defaultOptions);
	
	console.log("setupSoundManager", params);
	soundManager.setup(params);
}

function playSound(params){
	if(typeof params === "string"){
		var id = params;
		params = {
			id: id
		};
	}
	if(params.url === undefined){
		params.url = "assets/snd/"+params.id;
	}
	// assets\snd\click.wav
	var ext = ".ogg";
	params.url = params.url + ext;
	params.autoLoad = true;
	// params.autoPlay = true;
	// params.volume = soundManager.defaultOptions.volume;
	var snd = soundManager.createSound(params);
	console.log("sound", snd);
	snd.play();
	return snd;
}

function playMenuClickSound(){
	return playSound("menu-click");
}