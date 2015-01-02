Player = {}

function Player.new(x,y,world,drawing_register)
  local self = {}
  self.drawing_register = drawing_register
  self.health = 100
  self.scale = 20
  self.damage = 200
  self.gun = nil
  self.gunFixture = nil
  self.isAlive = true
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newPolygonShape(0, self.scale, self.scale/2, 0, self.scale, self.scale)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setUserData(self)
  setmetatable(self, {__index = Player})
  return self
end

function Player:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("smooth")
  love.graphics.setColor(0,255,0,200)
  love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

function Player:setVelocity(xVelocity, yVelocity)
  if self.isAlive then
    self.body:setLinearVelocity(xVelocity, yVelocity)
  end
end

function Player:attachGun(gun)
  self.gun = gun
  self.gunFixture = love.physics.newFixture(self.body, self.gun:getShape())
  self.gunFixture:setUserData(self)
  self.gun:setShipBody(self.body)
end

function Player:shoot()
  self.gun:fire()
end

function Player:getDamage()
  return self.damage
end

function Player:beginContact(entity)
  self.health = self.health - entity:getDamage()
  self:destroyIfNoHealthLeft()
end

function Player:destroyIfNoHealthLeft()
  if self.health <= 0 then
    print("player has no health left, destroying")
    self:destroy()
  end
end

function Player:destroy()
  self.fixture:destroy()
  self.body:destroy()
  self.drawing_register:removeDrawable(self)
  self.isAlive = false
end
