Gun = {}

function Gun.new(world,drawing_register)
  local self = {}
  self.xOrigin = 100
  self.yOrigin = 100
  self.world = world
  self.drawing_register = drawing_register
  self.fireRate = 3
  self.fireCount = 0
  self.body = love.physics.newBody(self.world, self.xOrigin, self.yOrigin, "kinematic")
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

function Gun:getBody()
  return self.body
end
