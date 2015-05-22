ApiController = extends BaseController {

	init = function(){
		super()
		header "Content-Type: application/json"
		// app.user.isLogged || @echoJson{error="required user.isLogged"}
		app.request.isAjax || _GET.debug_ajax == "1" || @echoJson{error="required request.isAjax"}
	},
	
	echoJson = function(data, end){
		echo(json.encode(data))
		end !== false && app.end()
	},

	actionStationInfo = function(id){
		var station = app.params.map.stations[id]
		@echoJson{station=station}
	},
	
	actionArmy = function(){
		var user_id = 1
		var rows = app.db.fetchAll("select * from {{army}} where user_id=:user_id order by id", {user_id = user_id})
		for(var i, row in rows){
			row.entities = app.db.fetchAll("select * from {{army_entity}} where army_id=:army_id order by ent_id", {army_id = row.id})
		}
		@echoJson {data = rows}
	},
	
	actionSaveArmyName = function(){
		var user_id = 1
		var army_id = toNumber(_POST.pk)
		var name = _POST.value.replace(Regexp(`/\s{2,}/`), " ").trim().sub(0, app.params.MAX_ARMY_NAME_LEN).trim()
		var r = app.db.execute("update {{army}} set name=:name where id=:id and user_id=:user_id",{
			user_id = user_id, 
			id = army_id,
			name = name,
		})
		var row = app.db.fetch("select name from {{army}} where id=:id", {id = army_id})
		@echoJson {result = r, value = row.name, data = _POST}
	},
	
	actionCaclulateBattle = function(event_id){
		var startTime = DateTime.now()
		var event = app.db.fetch("select * from {{event}} where id=:id and type=:type and processed=:processed", {
			id = event_id,
			type = EVENT_TYPE_BATTLE,
			processed = EVENT_HANDLE_NOT_STARTED,
		})
		if(event){
			app.db.execute("update {{event}} set processed=:processed, processed_time=:processed_time", {
				processed = EVENT_HANDLE_STARTED,
				processed_time = startTime,
			})
			
			var battleAttackers = []
			var battleDefenders = []
			var entitiesDesc = {}
			
			var entAttack = function(ent, i){
				var quantity = ent.quantity
			}
			
			var sideAttack = function(isAttacker){
				var attackers = isAttacker ? battleAttackers : battleDefenders
				var defenders = !isAttacker ? battleAttackers : battleDefenders
				
				for(var _, attacker in attackers){
					for(var _, ent in attacker.entities){
						entAttack(ent, 1) // psychic attack
						entAttack(ent, 2) // far attack
						entAttack(ent, 3) // short attack
					}
				}
				
			}
			
			var finishTurn = function(){
				
				
			}
			
			for(var turn = 1; turn <= 6; turn++){
				sideAttack(true)
				sideAttack(false)
				finishTurn()				
			}
			
			app.db.execute("update {{event}} set processed=:processed, processed_time=:processed_time", {
				processed = EVENT_HANDLE_FINISHED,
				processed_dt = DateTime.now() - startTime,
			})
		}
	},
}