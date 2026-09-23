-- Server entry: proves shared module loads and runs
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Smoke = require(ReplicatedStorage.Shared.Smoke)

print(Smoke.greet("server"))
