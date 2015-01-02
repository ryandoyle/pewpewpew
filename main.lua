require "player"
require "player_controller"
require "drawing_register"
require "gun"
require "boundary"
require "enemy"

debugWorldDraw = require("debugWorldDraw")


function love.load()
  world = love.physics.newWorld(0,0,true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  drawing_register = DrawingRegister.new()
  boundary = Boundary.new(700, 800, world)
  gun = Gun.new(world,drawing_register)
  player = Player.new(370,600, world, drawing_register)
  player:attachGun(gun)
  playerController = PlayerController.new(player)
  enemy = Enemy.new(100, 100, world, drawing_register)

  drawing_register:addDrawable(player)
  drawing_register:addDrawable(enemy)

  -- HAX
  static = {}
  static.b = love.physics.newBody(world, 400,400, "static") -- "static" makes it not move
  static.s = love.physics.newRectangleShape(200,50)         -- set size to 200,50 (x,y)
  static.f = love.physics.newFixture(static.b, static.s)
  --static.f:setUserData("Block")

end

function love.update(dt)
  require("lovebird").update()
  world:update(dt)
  playerController:update(dt)
end

function love.draw()
  debugWorldDraw(world, 0,0, 700, 800)
  drawing_register:drawRegisteredObjects()
  love.graphics.polygon("line", static.b:getWorldPoints(static.s:getPoints()))
end

function love.keypressed(key, unicode)
  if key == "d" then
    debug.debug()
  end
end

function beginContact(fixtureA, fixtureB, contact)
  local entityA = fixtureA:getUserData()
  local entityB = fixtureB:getUserData()
  if entityA ~= nil then
    entityA:beginContact(entityB)
  end
  if entityB ~= nil then
    entityB:beginContact(entityA)
  end
end
