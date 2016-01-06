local Parent = {balance=0}
function Parent:new( o )
	print("Parent:new")
	o=o or {}
	setmetatable(o,self)
	self.__index=self
	return o
end

return Parent
