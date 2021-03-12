local bump = require("libs/bump")
local Phi = {layer = 2,debug = false}

 Phi.world = bump.newWorld()
 Phi.color = {0,0,1,1}
 Phi.objs = {}
 Phi.idblacklist = {420}

  function Phi.add(obj,x,y,w,h)
    if w then
    obj.pos = {x = x,y = y}
    obj.size = {x = w, y = h}
    end
    Phi.world:add(obj,obj.pos.x,obj.pos.y,obj.size.x,obj.size.y)

    table.insert(Phi.objs,obj)
  end
  function Phi.add_box(obj)
    table.insert(Phi.objs,obj)
  end
  function Phi.kill_box(obj)
   for i = 1,#Phi.objs do
      if Phi.objs[i] == obj then
        table.remove(Phi.objs,i)
      end
    end
  end
  function Phi.kill(obj)
        for i = 1,#Phi.objs do
          if Phi.objs[i] == obj then
          table.remove(Phi.objs,i)
          Phi.world:remove(obj)
          end
        end
  end

  function Phi.move(obj,targetX,targetY,set)
      local nextX, nextY, cols, len = Phi.world:move(obj, targetX, targetY)
      if nextY then
      if set == true then obj.pos = {x = nextX,y = nextY} end
      end
         return nextX,nextY,cols
  end

   function Phi.update()
     if love.keyboard.isDown("tab") then
       Phi.debug = true
       else
       Phi.debug = false
     end
   end

  function Phi.get_id()
		for i = 1, #Phi.idblacklist do
			local id =  math.random(1,9999)
			if id ~= Phi.idblacklist[i] then
				table.insert(Phi.idblacklist,id)
				return id
			else
				Phi.get_id()
			end
		end
		end
  function Phi.boundingBox(obj1,obj2,margin)
  local margin = margin or 0
  return obj1.pos.x < obj2.pos.x+obj2.size.x + margin and
         obj2.pos.x - margin < obj1.pos.x+obj1.size.x and
         obj1.pos.y < obj2.pos.y+obj2.size.y + margin and
         obj2.pos.y - margin < obj1.pos.y+obj1.size.y
  end
	function Phi.draw()
	  if Phi.debug == true then
	  camera.set()
	  love.graphics.setColor(unpack(Phi.color))
	  for i,obj in ipairs(Phi.objs) do
	    love.graphics.rectangle("line",obj.pos.x,obj.pos.y,obj.size.x or 32, obj.size.y or 32)
	  end
	    camera.unset()
	    love.graphics.setColor(1,1,1,1)
	 end
	 end
	 looper.loopMe(Phi)
Phi.id = ui_render.renderMe(Phi)
return Phi
