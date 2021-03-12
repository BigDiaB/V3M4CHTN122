local gfx = love.graphics
local tilesheet = gfx.newImage("assets/sheets/tiles.png")

materials = {
	 {
		id = 01,
		quad = gfx.newQuad(1,1,32,32,tilesheet:getDimensions()),
		sheet = tilesheet,
		name = "proto",
	},
	 {
		id = 02,
		quad = gfx.newQuad(36,1,32,32, tilesheet:getDimensions()),
		sheet = tilesheet,
		name = "grass",
	},
	{
		id = 03,
		quad = gfx.newQuad(71,1,32,32, tilesheet:getDimensions()),
		sheet = tilesheet,
		name = "dirt",
	},
	{
		id = 04,
		quad = gfx.newQuad(104,1,32,32, tilesheet:getDimensions()),
		sheet = tilesheet,
		name = "grass_corner_right"
	},
	{
		id = 05,
		quad = gfx.newQuad(138,1,32,32, tilesheet:getDimensions()),
		sheet = tilesheet,
		name = "grass_corner_left"
	}
}
function get_world()
local chunks = require("assets/chunks")
local world = {
			{chunks.proto.full,chunks.proto.full,chunks.proto.full,chunks.proto.hole,chunks.proto.full},
			{chunks.proto.full,chunks.empty,chunks.empty,chunks.proto.hole,chunks.proto.full},
			{chunks.proto.full,chunks.proto.platform,chunks.proto.platform,chunks.proto.hole,chunks.proto.full},
			{chunks.proto.full,chunks.proto.tunnel,chunks.proto.tunnel,chunks.proto.cross,chunks.empty},
			{chunks.proto.full,chunks.proto.full,chunks.proto.full,chunks.proto.full,chunks.proto.full},
		}
local bg = {
		{chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker},
		{chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker},
		{chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker},
		{chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker},
		{chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker,chunks.grass_checker},
		}

return world,bg
end

function get_material(id,spot,chunk)
		for i = 1, #materials do
			if id == materials[i].id then
				sheet = materials[i].sheet
				quad = materials[i].quad
			end
		end
		if chunk.data[spot].id ~= 00 then
	return sheet,quad,chunk.data[spot].index.x  * 32, chunk.data[spot].index.y  * 32
end
end
