require "projectile"
Player = {}

function Player.new(x,y,world)
  local self = {}
  self.health = 100
  self.xSpeed = 1100
  self.ySpeed = 800
  self.scale = 20
  self.gun = nil
  self.gunFixture = nil
  self.body = love.physics.newBody(world, x, y, "kinematic")
  self.shape = love.physics.newPolygonShape(0, self.scale, self.scale/2, 0, self.scale, self.scale)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  setmetatable(self, {__index = Player})
  return self
end

function Player:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("smooth")
  love.graphics.setColor(0,255,0,200)
  love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

function Player:moveLeft(dt)
  self.body:setLinearVelocity(-self.xSpeed,0)
end

function Player:moveRight(dt)
  self.body:setLinearVelocity(self.xSpeed,0)
end

function Player:moveUp(dt)
  self.body:setLinearVelocity(0,-self.ySpeed)
end

function Player:moveDown(dt)
  self.body:setLinearVelocity(0,self.ySpeed)
end

function Player:stopMovement()
  self.body:setLinearVelocity(0,0)
end

function Player:attachGun(gun)
  self.gun = gun
  self.gunFixture = love.physics.newFixture(self.body, self.gun:getShape())
  self.gun:setGunBody(self.body)
end

function Player:shoot()
  self.gun:fire()
end
