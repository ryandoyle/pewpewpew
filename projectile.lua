Projectile = {}

function Projectile.new(xStart,yStart,world)
  local self = {}
  self.body = love.physics.newBody(world, xStart,yStart, "dynamic")
  self.body:setMass(10)
  self.shape = love.physics.newRectangleShape(1, 10)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.body:setBullet(true)
  setmetatable(self, {__index = Projectile})
  return self
end

function Projectile:fire()
  self.body:applyForce(0,-1000)
end

function Projectile:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("smooth")
  love.graphics.setColor(255,255,255,200)
  love.graphics.line(self.body:getWorldPoints(self.shape:getPoints()))
  --print("drawing" .. tostring(self))
end
