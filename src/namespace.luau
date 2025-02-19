local types = require(script.Parent.types)

local Namespace = {}
Namespace.__index = Namespace

function Namespace.new(key: string)
	local self = setmetatable({}, Namespace)
	self.key = key
	return self
end

function Namespace:boolean(flagKey: string): types.BooleanFlag
	return {
		type = "boolean",
		namespaceKey = self.key,
		flagKey = flagKey,
	}
end

return Namespace
