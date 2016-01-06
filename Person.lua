Person={name="until",age=0,sex="until"}
function Person:setPerson(name,age,sex)
	self.name=name
	self.age=age
	self.sex=sex
end
function Person:getName(  )
	return self.name
end
function Person:getAge(  )
	return self.age
end
function Person:getSex(  )
	return self.sex
end
function Person:Show(  )
	print(self.name)
	print(self.age)
	print(self.sex)
end
return Person