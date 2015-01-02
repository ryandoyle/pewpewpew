require "projectile"
Gun = {}

function Gun.new(world,drawing_register)
  local self = {}
  self.world = world
  self.drawing_register = drawing_register
  self.fireRate = 1
  self.fireCount = 0
  self.shape = love.physics.newRectangleShape(10,10)
  self.body = nil
  setmetatable(self, {__index = Gun})
  return self
end

function Gun:fire()
  -- FIXME: This is shit
  if self.fireCount == self.fireRate then
    local x, y = self.shipBody:getPosition()
    local projectile = Projectile.new(x, y, self.world, self.drawing_register)
    projectile:fire()
    self.drawing_register:addDrawable(projectile)
    self.fireCount = 0
  else 
    self.fireCount = self.fireCount + 1
  end
end

function Gun:getShape()
  return self.shape
end

function Gun:setShipBody(shipBody)
  self.shipBody = shipBody
end
