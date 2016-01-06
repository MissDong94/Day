--[[
Hero={attack=0}
function Hero:new(o )
	o=o or {}
	setmetatable(o,self)
	self.__index=self
	return o
end
function Hero:skill( addAttack )
	self.attack=self.attack+addAttack
end

--继承
oneHero=Hero:new({attack=100})
oneHero:skill(10)
print(oneHero.attack)

function oneHero:test()
	print("test")
end
function oneHero:injured( loseAttack )
	self.attack=self.attack-loseAttack/2
end
oneHero:injured(100)
print(oneHero.attack)-->60
oneHero:test()]]
--多继承
function seatch(classes,key)
	for i=1 , #classes do
		local value = classes[i][key]
		if value ~= nil then
			return value
		end
	end
end

local t1 = {game1="game111"}
local t2 = {game2="game222"}
print(seatch({t1,t2},"game2"))

function createClass(...)
	local parents = {...}
	local child = {}
	setmetatable(child,{
		__index = function(table,key)
		return seatch(parents,key)
	end
	})

	function child:new()
		o={}
		setmetatable(o,child)
		child.__index = child
		return o
	end
	return child
end

TSprite = {}
function TSprite:hello()
	print("Ts")
end
function TSprite:new(o)
	o = {}
	setmetatable(o,self)
	self.__index = self
	return o
end

TBullet = {}
function TBullet:fire()
	print("Tb")
end
function TBullet:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

TCreate = {}
function TCreate:doit()
	print("Tc")
end
function TCreate:new()
	o = {}
	setmetatable(o,self)
	self.__index = self
	return o
end

local BulletSprite = createClass(TSprite,TBullet,TCreate)
local bSprite = BulletSprite:new()
bSprite:hello()
bSprite.fire()
bSprite.doit()