local Tag = {}
local tags = {}
function Tag:new(obj,type,trigger,text)
  local tag = {trigger = trigger, text = text or "test",type = type,identifier = obj}

if tag.type == "name_tag" then
  tag.draw = function()
   if love.keyboard.isDown(tag.trigger) then
      love.graphics.setFont(smallfont)
      love.graphics.setColor(0.3,0.3,0.3,0.7)
      love.graphics.rectangle("fill",obj.pos.x - obj.size.x / 2,obj.pos.y - 20,smallfont:getWidth(tag.text) + 4,10)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(tag.text,obj.pos.x - obj.size.x / 2 + 3, obj.pos.y -22)
      love.graphics.setFont(Font)
    end
    end
elseif tag.type == "description" then
  tag.draw = function()
   if love.keyboard.isDown(tag.trigger) then
      love.graphics.setFont(middlefont)
      love.graphics.setColor(0.3,0.3,0.3,0.7)
      for i = 1, math.floor(obj.size.y / 10) + 1 do
      love.graphics.rectangle("fill",obj.pos.x + obj.size.x  + 2,obj.pos.y - 20 + (i * 10),middlefont:getWidth(tag.text) + 4,10)
      end
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(tag.text,obj.pos.x + obj.size.x + 3, obj.pos.y -10)
      love.graphics.setFont(Font)
    end
end
end
tag.id = renderer.renderMe(tag,5)
  table.insert(tags,tag)
  return tag
end
function Tag:kill(obj)
  for l,tag in ipairs(tags) do
    if tag.identifier == obj then
    renderer.destroyMe(tag,5)
    tag.draw = function() end
    table.remove(tags,l)
    end
  end
end
return Tag
