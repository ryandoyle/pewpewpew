require "projectile"
Player = {}

function Player.new(x,y,world,projectiles)
  local self = {}
  self.xOrigin = x
  self.yOrigin = y
  self.world = world
  self.projectiles = projectiles
  self.health = 100
  self.xSpeed = 1100
  self.ySpeed = 800
  self.scale = 20
  setmetatable(self, {__index = Player})
  return self
end

function Player:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("smooth")
  love.graphics.setColor(0,255,0,200)
  love.graphics.polygon("line", self.xOrigin, self.yOrigin+self.scale, self.xOrigin+(self.scale/2), self.yOrigin, self.xOrigin+self.scale, self.yOrigin+self.scale)
end

function Player:moveLeft(dt)
  if self.xOrigin > 0 then
    self.xOrigin = self.xOrigin - (self.xSpeed * dt)
  end
end

function Player:moveRight(dt)
  if (self.xOrigin + self:getWidth()) < love.window.getWidth() then
    self.xOrigin = self.xOrigin + (self.xSpeed * dt)
  end
end

function Player:moveUp(dt)
  if self.yOrigin > 0 then
    self.yOrigin = self.yOrigin - (self.ySpeed * dt)
  end
end

function Player:moveDown(dt)
  if (self.yOrigin + self:getHeight()) < love.window.getHeight() then
    self.yOrigin = self.yOrigin + (self.ySpeed * dt)
  end
end

function Player:getWidth()
  return self.scale
end

function Player:getHeight()
  return self.scale
end

function Player:shoot()
  projectile = Projectile.new(self.xOrigin, self.yOrigin, self.world)
  projectile:fire()
  self.projectiles:addProjectile(projectile)
end
