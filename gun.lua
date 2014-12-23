Gun = {}

function Gun.new(world,drawing_register)
  local self = {}
  self.xOrigin = nil
  self.yOrigin = nil
  self.world = world
  self.drawing_register = drawing_register
  self.fireRate = 3
  self.fireCount = 0
  setmetatable(self, {__index = Gun})
  return self
end

function Gun:fire()
  if self.fireCount == self.fireRate then
    projectile = Projectile.new(self.xOrigin, self.yOrigin, self.world)
    projectile:fire()
    self.drawing_register:addDrawable(projectile)
    self.fireCount = 0
  else 
    self.fireCount = self.fireCount + 1
  end
end

function Gun:updateCoodinates(x,y)
  self.xOrigin = x
  self.yOrigin = y
end
