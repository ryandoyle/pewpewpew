require "player"
require "player_controller"
require "projectiles"

function love.load()
  world = love.physics.newWorld(0,0,true)
  projectiles = Projectiles.new()
  player = Player.new(370,600, world, projectiles)
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
  world:update(dt)
end

function love.draw()
  player:draw()
  projectiles:draw()
  love.graphics.polygon("line", static.b:getWorldPoints(static.s:getPoints()))
end
