Enemy = {}

function Enemy.new(xStart, yStart, world, drawing_register)
  local self = {}
  self.world = world
  self.drawing_register = drawing_register
  self.health = 100
  self.damage = 200
  self.body = love.physics.newBody(self.world, xStart, yStart, "dynamic")
  self.shape = love.physics.newRectangleShape(50, 50)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setUserData(self)
  setmetatable(self, {__index = Enemy})
  return self
end

function Enemy:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("smooth")
  love.graphics.setColor(255,255,255,200)
  love.graphics.line(self.body:getWorldPoints(self.shape:getPoints()))
end

function Enemy:beginContact(entity)
  -- FIXME: Not all entities follow the same interface (yet?)
  self.health = self.health - entity:getDamage()
  self:destroyIfNoHealthLeft()
end

function Enemy:destroyIfNoHealthLeft()
  if self.health <= 0 then
    print("enemy has no health left, destroying")
    self:destroy()
  end
end

function Enemy:destroy()
  self.fixture:destroy()
  self.body:destroy()
  self.drawing_register:removeDrawable(self)
end

function Enemy:getDamage()
  return self.damage
end
