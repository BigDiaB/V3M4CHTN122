local Functions = {}
	function Functions:init(Terminal)
		local functions = {

			help = function()
				Terminal.print("/kill")
				Terminal.print("/setTime")
				Terminal.print("/giveAb")
				Terminal.print("/help")
			end,
			kill = function(obj)
			obj.health = 0
			Terminal.print("U ded")
			end,
			setTime = function(newTime)
				time = newTime
			end,
			giveAb = function(ab,obj)
			  obj.abilities[ab] = true
			end,
		}

		return functions
	end
return Functions
