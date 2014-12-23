require "player"
require "player_controller"
require "drawing_register"
require "gun"

function love.load()
  world = love.physics.newWorld(0,0,true)
  drawing_register = DrawingRegister.new()
  gun = Gun.new(world,drawing_register)
  player = Player.new(370,600)
  player:attachGun(gun)
  playerController = PlayerController.new(player)

  -- HAX
  static = {}
  static.b = love.physics.newBody(world, 400,400, "static") -- "static" makes it not move
  static.s = love.physics.newRectangleShape(200,50)         -- set size to 200,50 (x,y)
  static.f = love.physics.newFixture(static.b, static.s)
  static.f:setUserData("Block")

end

function love.update(dt)
  playerController:update(dt)
  player:update(dt) -- FIXME: This will be redudant when gun coords are done via physics
  world:update(dt)
end

function love.draw()
  player:draw()
  drawing_register:drawRegisteredObjects()
  love.graphics.polygon("line", static.b:getWorldPoints(static.s:getPoints()))
end
