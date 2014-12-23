DrawingRegister = {}

function DrawingRegister.new()
  local self = {}
  self.drawables = {}
  setmetatable(self, {__index = DrawingRegister})
  return self
end

function DrawingRegister:addDrawable(drawable)
  table.insert(self.drawables, drawable)
end

function DrawingRegister:drawRegisteredObjects()
  for i, drawable in ipairs(self.drawables) do 
    drawable:draw()
  end
end
