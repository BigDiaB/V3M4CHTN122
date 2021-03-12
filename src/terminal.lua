local Terminal = {layer = 2}
local bing_strength = 1
local bing = false
local abs_first = true
local first = true
local command = " "
local draw_command = false

function Terminal.activate()
  if draw_command ~= true then
    draw_command = true end
end

functions = require("assets/functions"):init(Terminal)
messages = {}
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
    end
  end

  function split(command)
local COMMAND_WITH_ARGS = {}
for ARG in command:gmatch("%S+") do
   table.insert(COMMAND_WITH_ARGS, ARG)
end
return COMMAND_WITH_ARGS
end


function exe(command)
  if string.find(command, "/") and not string.find(command, " ") then
    command = string.gsub(command, "/", "")
    local status, err = pcall(load("functions."..command .."()"))
    if status == true then
    else
    command = string.gsub(command, " ","")
    command = string.gsub(command, "()","")
    Terminal.print("/"..command.. " ist kein definierter Befehl oder Du hast falsche Parameter angegeben!!")
  end
elseif string.find(command, "/") and string.find(command, " ") then
  local cwa = split(command)
  cwa[1] = string.gsub(cwa[1], "/", "")
  if #cwa == 3 then
      local status, err = pcall(load("functions."..cwa[1] .."(".. cwa[2]..",".. cwa[3]..")"))
      if status == true then
      else
      --cwa[1] = string.gsub(cwa, "()","")
      Terminal.print("/"..cwa[1].. " ist kein definierter Befehl oder Du hast falsche Parameter angegeben!!") end
  elseif #cwa == 2 then
    local status, err = pcall(load("functions."..cwa[1] .."(".. cwa[2]..")"))
      if status == true then
      else
        if string.find(cwa[1], " ") then
      cwa[1] = string.gsub(cwa, " ","")
    end
      cwa[1] = string.gsub(cwa[1], "()","")
    Terminal.print("/" ..cwa[1].. " ist kein definierter Befehl oder Du hast falsche Parameter angegeben!!")
    end
  end
else Terminal.print(command)
  end
end


Terminal.draw = function()
if draw_command then
function love.textinput(t)
  if t ~= "ü" and t ~= "Ü" and t ~= "ä" and t ~= "Ä" and t ~= "ö" and t ~= "Ö" and t ~= "ß" then
  if draw_command then
  if abs_first then command = command:sub(1, -2) command = command ..t command = command:sub(1, -2) abs_first = false end
  --if first then first = false else
  command= command ..""..t end
--end
end end
  function love.keypressed(key)
    if key == "backspace" then
  --    command = ""
  command = command:sub(1, -2)
    elseif key == "return" and command ~= "" then
      --Terminal.print(command)
      exe(command)
      command = ""
      draw_command = false
end end
versatz = 30
for i, msg in ipairs(messages) do
  love.graphics.setColor(0.2, 0.2, 0.2, 0.8)
  love.graphics.rectangle("fill", msg.bx,msg.by - msg.bh,Font:getWidth(msg.string) + 4,msg.bh)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print(msg.string,msg.x + 2,msg.y - msg.bh)
end
  love.graphics.setColor(0.2, 0.2, 0.2, 0.8)
  love.graphics.rectangle("fill",0,love.graphics.getHeight() - 20,love.graphics.getWidth(),20)
  love.graphics.setColor(1,1,1,1)
  love.graphics.print(command,0,love.graphics.getHeight() - 20)

end
if bing == true then
  for i, msg in ipairs(messages) do
  love.graphics.setColor(0.2, 0.2, 0.2, 0.8 + bing_strength)
  love.graphics.rectangle("fill", msg.bx,msg.by - msg.bh,Font:getWidth(msg.string) + 4,msg.bh)
  love.graphics.setColor(1, 1, 1, bing_strength)
  love.graphics.print(msg.string,msg.x,msg.y - msg.bh)
  love.graphics.setColor(1, 1, 1, 1)
end
end
end



function Terminal.print(string)
  local msg = {
    x = 0,
    y = love.graphics.getHeight() - 20,
    string = string,
    bx = 0,
    bw = 200,
    bh = 20,
    pos = 0,
  }
  msg.by = msg.y + 10,
  table.insert(messages,msg)
  for i, msg in ipairs(messages) do
    msg.pos = msg.pos + 1
  end
  bing = true
  bing_strength = 1
  return msg
end

Terminal.update = function()
local dt = love.timer.getDelta()
if bing then
  if bing_strength > 0.16 then
  bing_strength = bing_strength + 1 * (-1 * dt / 5)
end
if bing_strength <= 0.16 then
  bing_strength = 0
  bing = false
end
else bing_strength = 1
end
  if love.keyboard.isDown("t") and not draw_command then
    draw_command = true
  elseif love.keyboard.isDown("escape") and draw_command then
    first = true
  draw_command = false
  command = ""
  bing = true end
for i, msg in ipairs(messages) do
  if msg then
    if msg.pos + 2 >= 30 then
    table.remove(messages,i) end
end
  msg.y = love.graphics.getHeight() - positions[msg.pos] or 0
  msg.by = love.graphics.getHeight() - positions[msg.pos] - 2

end end
Terminal.load = function()
positions = {}
  for i = 1, love.graphics.getHeight() / 20 + 10 do
    positions[i] = i * 20
  end
 Terminal.print("[init-message]")
end
function Terminal.return_can_move(obj)
  if draw_command == true then
    obj.can_move = false
  else
    obj.can_move = true
  end
end

if looper then
  looper.loopMe(Terminal)
  loader.loadMe(Terminal)
  ui_render.renderMe(Terminal,Terminal.layer)
end

return Terminal
