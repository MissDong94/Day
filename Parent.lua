local Parent = {balance=0}
function Parent:new( o )
	print("Parent:new")
	o=o or {}
	setmetatable(o,self)
	self.__index=self
	return o
end
function Parent:test(  )
	print("Parent:test")
end
return Parent