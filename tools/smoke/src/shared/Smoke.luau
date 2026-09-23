-- Smoke test: shared module
local Smoke = {}

function Smoke.greet(name: string): string
	return "WuBuGames pipeline live, " .. name .. "!"
end

return Smoke
