Projectiles = {}

function Projectiles.new()
  local self = {}
  self.projectiles = {}
  setmetatable(self, {__index = Projectiles})
  return self
end

function Projectiles:addProjectile(projectile)
  table.insert(self.projectiles, projectile)
end

function Projectiles:draw()
  if not self.projectiles == nil then 
    table.foreach(self.projectiles, drawSingleProjectile)
  end
end

local function drawSingleProjectile(projectile)
  projectile:draw()
end
