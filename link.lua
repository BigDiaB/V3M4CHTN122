local link = {}

link.ui_render = require("V3RM4CHTN122/src/ui_renderer")
link.renderer = require("V3RM4CHTN122/src/renderer")
link.looper = require("V3RM4CHTN122/src/gameloop")
link.loader = require("V3RM4CHTN122/src/objloader")
link.tick = require("V3RM4CHTN122/src/tick")
link.phi = require("V3RM4CHTN122/src/physician")
link.terminal  = require("V3RM4CHTN122/src/terminal")

function link.init3(numLayers,ui)
    link.renderer:init(numLayers)
    link.ui_render:init(ui)
end

function link.addRenderer(numLayer,priority)
local renderer = require("V3RM4CHTN122/src/simple_renderer):init(numLayer")
    renderer.id = link.renderer.renderMe(renderer,priority)
    return renderer
end

function link.up()
    link.camera = require("V3RM4CHTN122/src/camera")
    link.threader = require("V3RM4CHTN122/src/threader")
    link.thread_lib = require("V3RM4CHTN122/src/thread_lib")
    link.ui = require("V3RM4CHTN122/src/ui")
    link.tagger = require("V3RM4CHTN122/src/tag")
    link.unity = require("V3RM4CHTN122/src/unity")
end

return link
