local HttpService = game:GetService("HttpService")

local types = require(script.Parent.types)

type BooleanFlag = types.BooleanFlag

type FliptConfig = {
	url: string,
	apiKey: string?,
}

local Flipt = {}
Flipt.__index = Flipt

function Flipt.new(config: FliptConfig)
	local self = setmetatable({}, Flipt)
	self.config = config
	return self
end

function Flipt:evaluate(flag: BooleanFlag, entityId: string, context: {}?)
	local res = HttpService:RequestAsync({
		Method = "POST",
		Url = `{self.config.url}/api/v1/evaluate/{flag.type}`,
		Headers = {
			["Content-Type"] = "application/json",
		},
		Body = HttpService:JSONEncode({
			namespaceKey = flag.namespaceKey,
			flagKey = flag.flagKey,
			entityId = entityId,
			context = context,
		}),
	})

	assert(res.Success, `evaluate: {res.StatusCode} {res.StatusCode} - {res.Body}`)

	-- TODO: decode
end

return Flipt
