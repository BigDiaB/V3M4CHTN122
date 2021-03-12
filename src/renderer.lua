local Renderer = {}

	local idblacklist = {420}
	local insert = table.insert
	local remove = table.remove
function Renderer:init(numLayers)
	local renderer = {}

	renderer.drawers = {}
	for i = 0, numLayers do
	renderer.drawers[i] = {}
	for j = 0,9999 do
	renderer.drawers[i][j] = {}
	end
	end

	renderer.renderMe = function(thing,layer)
		local l = thing.layer or layer
		local i = renderer.id()
		insert(renderer.drawers[l][i],thing)
		return i
	end
	renderer.destroyMe = function(thing,layer)
		local l = thing.layer or layer
		local i = thing.id
		remove(renderer.drawers[l],i)
		remove(idblacklist,id)
	end
	renderer.draw = function()

		for layer = 1, #renderer.drawers do
			for id = 1,#renderer.drawers[layer] do
				for draw = 1,#renderer.drawers[layer][id] do
					local thing = renderer.drawers[layer][id][draw]
					if thing ~= nil then
						thing:draw()
					end
				end
			end
		end
	end

	renderer.id = function()
		for i = 1, #idblacklist do
			local id =  math.random(1,9999)
			if id ~= idblacklist[i] then
				table.insert(idblacklist,id)
				return id
			else
				renderer.id()
			end
		end
	end

	return renderer
end

return Renderer
