PlayerController = {}

function PlayerController.new(player)
  local self = {}
  self.player = player 
  setmetatable(self, {__index = PlayerController})
  return self
end

function PlayerController:update(dt)
  self:handleInput(dt)
end

function PlayerController:handleInput(dt)
  if love.keyboard.isDown("left") then
    self.player:moveLeft(dt)
  end
  if love.keyboard.isDown("right") then
    self.player:moveRight(dt)
  end
  if love.keyboard.isDown("up") then
    self.player:moveUp(dt)
  end
  if love.keyboard.isDown("down") then
    self.player:moveDown(dt)
  end
  if love.keyboard.isDown(" ") then
    self.player:shoot()
  end
end
