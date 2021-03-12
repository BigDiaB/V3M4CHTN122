local Particles = {}

function Particles:init()
	local particles = {layer = 5}
	local parts = {}
	local idblacklist = {420}
	function particles.new(ARGS)
		local part = {
			timer = ARGS[4],
			id = particles.get_id(),
			pos = {x = ARGS[1],y = ARGS[2]},
			layer = 4,
			}
			part.draw = function() 
				love.graphics.setColor(unpack(ARGS[3])) 
				love.graphics.circle("fill",part.pos.x,part.pos.y,ARGS[7] or 3) 
				love.graphics.setColor(1,1,1,1)
			end

			part.update = function(dt) 
				part.vel = {x = math.random(0,20) / 10 - 1 + ARGS[5],y = math.random(-1,1) + ARGS[6]} 
				part.timer = part.timer - (dt * 10) part.pos.x = part.pos.x + (dt * 100 * part.vel.x) 
				part.pos.y = part.pos.y + (dt * 100 * part.vel.y) 
				if part.timer <= 0 then 
					table.remove(idblacklist,part.id)
					for i, paris in ipairs(parts) do
						if paris.id == part.id then
							table.remove(parts,i)
						end
					end
					looper.stopMe(part) 
				end
			end
			
			looper.loopMe(part)
			table.insert(parts,part)
			idblacklist[part.id] = part.id

	end
	function particles.get_id()
		for i = 1, #idblacklist do
			::retry::
			local id =  math.random(1,9999)
			if id ~= idblacklist[i] then
				table.insert(idblacklist,id)
				return id
			else
			particles.get_id()
			end
		end
	end

	function particles.draw(act,part)
		for i = 1,#parts do
			parts[i].draw()
		end
	end
	particles.id = renderer.renderMe(particles)
	return particles
end

return Particles