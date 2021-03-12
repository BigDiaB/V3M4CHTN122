local chunk_loader = {}
function chunk_loader.generate(px,py,map,layer,notRender,notSolid)
local TILE_LAYER = layer or 2
local chunk = {pos = {x = px * 8 - 8,y = py * 8 - 8},data = {}}
   chunk.data[1] = {type = map[py][px][1] , index = {x = 1 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[2] = {type = map[py][px][2] , index = {x = 2 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[3] = {type = map[py][px][3] , index = {x = 3 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[4] = {type = map[py][px][4] , index = {x = 4 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[5] = {type = map[py][px][5] , index = {x = 5 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[6] = {type = map[py][px][6] , index = {x = 6 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[7] = {type = map[py][px][7] , index = {x = 7 + chunk.pos.x,y = 1 + chunk.pos.y}}
   chunk.data[8] = {type = map[py][px][8] , index = {x = 8 + chunk.pos.x,y = 1 + chunk.pos.y}}

   chunk.data[9] = {type = map[py][px][9] , index = {x = 1 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[10] = {type = map[py][px][10] , index = {x = 2 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[11] = {type = map[py][px][11] , index = {x = 3 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[12] = {type = map[py][px][12] , index = {x = 4 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[13] = {type = map[py][px][13] , index = {x = 5 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[14] = {type = map[py][px][14] , index = {x = 6 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[15] = {type = map[py][px][15] , index = {x = 7 + chunk.pos.x,y = 2 + chunk.pos.y}}
   chunk.data[16] = {type = map[py][px][16] , index = {x = 8 + chunk.pos.x,y = 2 + chunk.pos.y}}

   chunk.data[17] = {type = map[py][px][17] , index = {x = 1 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[18] = {type = map[py][px][18] , index = {x = 2 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[19] = {type = map[py][px][19] , index = {x = 3 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[20] = {type = map[py][px][20] , index = {x = 4 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[21] = {type = map[py][px][21] , index = {x = 5 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[22] = {type = map[py][px][22] , index = {x = 6 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[23] = {type = map[py][px][23] , index = {x = 7 + chunk.pos.x,y = 3 + chunk.pos.y}}
   chunk.data[24] = {type = map[py][px][24] , index = {x = 8 + chunk.pos.x,y = 3 + chunk.pos.y}}

   chunk.data[25] = {type = map[py][px][25] , index = {x = 1 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[26] = {type = map[py][px][26] , index = {x = 2 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[27] = {type = map[py][px][27] , index = {x = 3 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[28] = {type = map[py][px][28] , index = {x = 4 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[29] = {type = map[py][px][29] , index = {x = 5 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[30] = {type = map[py][px][30] , index = {x = 6 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[31] = {type = map[py][px][31] , index = {x = 7 + chunk.pos.x,y = 4 + chunk.pos.y}}
   chunk.data[32] = {type = map[py][px][32] , index = {x = 8 + chunk.pos.x,y = 4 + chunk.pos.y}}

   chunk.data[33] = {type = map[py][px][33] , index = {x = 1 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[34] = {type = map[py][px][34] , index = {x = 2 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[35] = {type = map[py][px][35] , index = {x = 3 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[36] = {type = map[py][px][36] , index = {x = 4 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[37] = {type = map[py][px][37] , index = {x = 5 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[38] = {type = map[py][px][38] , index = {x = 6 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[39] = {type = map[py][px][39] , index = {x = 7 + chunk.pos.x,y = 5 + chunk.pos.y}}
   chunk.data[40] = {type = map[py][px][40] , index = {x = 8 + chunk.pos.x,y = 5 + chunk.pos.y}}

   chunk.data[41] = {type = map[py][px][41] , index = {x = 1 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[42] = {type = map[py][px][42] , index = {x = 2 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[43] = {type = map[py][px][43] , index = {x = 3 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[44] = {type = map[py][px][44] , index = {x = 4 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[45] = {type = map[py][px][45] , index = {x = 5 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[46] = {type = map[py][px][46] , index = {x = 6 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[47] = {type = map[py][px][47] , index = {x = 7 + chunk.pos.x,y = 6 + chunk.pos.y}}
   chunk.data[48] = {type = map[py][px][48] , index = {x = 8 + chunk.pos.x,y = 6 + chunk.pos.y}}

   chunk.data[49] = {type = map[py][px][49] , index = {x = 1 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[50] = {type = map[py][px][50] , index = {x = 2 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[51] = {type = map[py][px][51] , index = {x = 3 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[52] = {type = map[py][px][52] , index = {x = 4 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[53] = {type = map[py][px][53] , index = {x = 5 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[54] = {type = map[py][px][54] , index = {x = 6 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[55] = {type = map[py][px][55] , index = {x = 7 + chunk.pos.x,y = 7 + chunk.pos.y}}
   chunk.data[56] = {type = map[py][px][56] , index = {x = 8 + chunk.pos.x,y = 7 + chunk.pos.y}}

   chunk.data[57] = {type = map[py][px][57] , index = {x = 1 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[58] = {type = map[py][px][58] , index = {x = 2 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[59] = {type = map[py][px][59] , index = {x = 3 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[60] = {type = map[py][px][60] , index = {x = 4 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[61] = {type = map[py][px][61] , index = {x = 5 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[62] = {type = map[py][px][62] , index = {x = 6 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[63] = {type = map[py][px][63] , index = {x = 7 + chunk.pos.x,y = 8 + chunk.pos.y}}
   chunk.data[64] = {type = map[py][px][64] , index = {x = 8 + chunk.pos.x,y = 8 + chunk.pos.y}}

   for i = 1, #chunk.data do
      if chunk.data[i].type ~= 00 then
         chunk.data[i].draw = function() love.graphics.draw(get_material(chunk.data[i].type,i,chunk)) end
         if not notRender then
           chunk.data[i].id = Game.renderer.renderMe(chunk.data[i],TILE_LAYER)
         end
         if not notSolid then
            phi.add(chunk.data[i],chunk.data[i].index.x * 32,chunk.data[i].index.y * 32,32,32)
         end
      end
   end
   return chunk
end


function chunk_loader.remove_chunk(chunk)
   for i = 1,#chunk.data do
      world:remove(chunk.data[i])
      Game.renderer.destroyMe(chunk.data[i],TILE_LAYER)
   end
   chunk.data = nil
end


return chunk_loader
