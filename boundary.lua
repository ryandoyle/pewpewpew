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
  self.topFixture:setUserData(self)
  self.leftFixture = love.physics.newFixture(self.body, self.left)
  self.leftFixture:setUserData(self)
  self.bottomFixture = love.physics.newFixture(self.body, self.bottom)
  self.bottomFixture:setUserData(self)
  self.rightFixture = love.physics.newFixture(self.body, self.right)
  self.rightFixture:setUserData(self)
  setmetatable(self, {__index = Boundary})
  return self
end

function Boundary:beginContact()
  print("boundary has been hit")
end

function Boundary:destory()
  -- Can't be destroyed
end
