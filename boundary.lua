Boundary = {}

function Boundary.new(width, height, world)
  local self = {}
  self.width = width
  self.height = height
  self.world = world
  self.body = love.physics.newBody(self.world, 0,0, "static")
  self.top = love.physics.newEdgeShape(1,1,self.width,1)
  self.left = love.physics.newEdgeShape(1,1,1,self.height)
  self.bottom = love.physics.newEdgeShape(1,self.height,self.width,self.height)
  self.right = love.physics.newEdgeShape(self.width,1,self.width,self.height)
  self.topFixture = love.physics.newFixture(self.body, self.top)
  self.leftFixture = love.physics.newFixture(self.body, self.left)
  self.bottomFixture = love.physics.newFixture(self.body, self.bottom)
  self.rightFixture = love.physics.newFixture(self.body, self.right)
  setmetatable(self, {__index = Boundary})
  return self
end
