local ui = {}

function ui.makeGraph(var,heightOff,smallboi,colour)
  local color = colour
  local smallboi = smallboi or false
  if not smallboi then
    local x = love.graphics.getWidth() / 4
    local y = 20 + heightOff
    local w = ((var * ((love.graphics.getWidth() / 2)) / 100))
    local h = 30
    local fx = x - 2
    local fy = y -2
    local fw = ((100 * ((love.graphics.getWidth() / 2)) / 100)) + 4
    local fh = h + 4

          if w > 0 then
    love.graphics.setColor(unpack(color))
    love.graphics.rectangle("fill",x,y,w,h,4,4,4)
    love.graphics.setColor(1,1,1,1)
  end
    love.graphics.rectangle("line",fx,fy,fw,fh,8,8,8)

  else
    local x = love.graphics.getWidth() / 4
    local y = 20 + heightOff
    local w = ((var * ((love.graphics.getWidth() / 2)) / 100)) / 4
    local h = 20
    local fx = x - 2
    local fy = y -2
    local fw = (((100 * ((love.graphics.getWidth() / 2)) / 100))) / 4 + 4
    local fh = h + 4

          if w > 0 then
    love.graphics.setColor(unpack(color))
    love.graphics.rectangle("fill",x,y,w,h,4,4,4)
    love.graphics.setColor(1,1,1,1)
  end
    love.graphics.rectangle("line",fx,fy,fw,fh,8,8,8)
  end

end

function ui.percent(now,max)
  return (now * 100) / max
end

return ui
