local namespace = require(script.namespace)
local flipt = require(script.flipt)
local types = require(script.types)

export type BooleanFlag = types.BooleanFlag

return {
	Namespace = namespace,
	Client = flipt,
}
