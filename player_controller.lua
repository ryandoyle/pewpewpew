PlayerController = {}

function PlayerController.new(player)
  local self = {}
  self.player = player 
  self.xVelocity = 1100
  self.yVelocity = 800
  self.currentXVelocity = 0
  self.currentYVelocity = 0
  self.acceleration = 100
  setmetatable(self, {__index = PlayerController})
  return self 
end

function PlayerController:update(dt)
  self:handleInput(dt)
end

function PlayerController:movementKeyIsPressed()
  return love.keyboard.isDown("left") or love.keyboard.isDown("right") or love.keyboard.isDown("up") or love.keyboard.isDown("down")
end

function PlayerController:handleInput(dt)
  if self:movementKeyIsPressed() then
    if love.keyboard.isDown("left") then
      self.currentXVelocity = -self.xVelocity
    end
    if love.keyboard.isDown("right") then
      self.currentXVelocity = self.xVelocity
    end
    if love.keyboard.isDown("up") then
      self.currentYVelocity = -self.yVelocity
    end
    if love.keyboard.isDown("down") then
      self.currentYVelocity = self.yVelocity
    end
  else
    self.currentYVelocity = 0
    self.currentXVelocity = 0
  end

  self.player:setVelocity(self.currentXVelocity, self.currentYVelocity)

  if love.keyboard.isDown(" ") then
    self.player:shoot()
  end
end
