local ObjLoader = {}
	local insert = table.insert
	local remove = table.remove
function ObjLoader:init()
	local loader = {}

	loader.loads = {}


	loader.loadMe = function(thing)
		insert(loader.loads,thing)
	end
	loader.unloadMe = function(thing)
		thing.unload = true
		for l, obj in ipairs(loader.loads) do
			if obj.unload then
				remove(loader.loads, l)
			end
		end
	end
	loader.load = function()

		for load = 1, #loader.loads do 
			if loader.loads[load] ~= nil then
				loader.loads[load]:load()
			end
		end
	end
	return loader
end


	return ObjLoader