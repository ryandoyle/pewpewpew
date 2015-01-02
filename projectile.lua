Projectile = {}

function Projectile.new(xStart,yStart,world,drawing_register)
  local self = {}
  self.bulletLength = 10
  self.damage = 10
  -- FIXME: There is probably a better way to ensure the bodies to not collide than
  -- offsetting the body
  self.body = love.physics.newBody(world, xStart, yStart-self.bulletLength-1, "dynamic")
  self.body:setMass(10)
  self.shape = love.physics.newRectangleShape(1, self.bulletLength)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setUserData(self)
  self.body:setBullet(true)
  self.drawing_register = drawing_register
  setmetatable(self, {__index = Projectile})
  return self
end

function Projectile:getDamage()
  return self.damage
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

function Projectile:beginContact()
  print("collided, deleting projectile " .. tostring(self) )
  self:destroy()
end

function Projectile:destroy()
  self.fixture:destroy()
  self.body:destroy()
  self.drawing_register:removeDrawable(self)
end
