-- Client entry
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Smoke = require(ReplicatedStorage.Shared.Smoke)

print(Smoke.greet("client"))
