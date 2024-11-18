wait(.3)
local placeId = game.PlaceId
local jobId = game.JobId

local sea1 = 2753915549
local sea2 = 4442272183
local sea3 = 7449423635

local CheckSea
if placeId == sea1 then
    CheckSea = "Sea 1"
elseif placeId == sea2 then
    CheckSea = "Sea 2"
elseif placeId == sea3 then
    CheckSea = "Sea 3"
else
    CheckSea = "unknown sea"
end

local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ExecutorUsing = identifyexecutor()
local HttpService = game:GetService("HttpService")
local Data =
{
    ["embeds"] = {
        {
            ["title"] = "Thông Tin Account",
            ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId,
            ["description"] = "```"..game.Players.LocalPlayer.DisplayName.." ```",
            ["color"] = tonumber("0xf7c74b"),
            ["thumbnail"] = {["url"] = "https://cdn.discordapp.com/attachments/1200025693866696735/1308025195000369252/Screenshot_2024-10-01-10-06-47-767_com.miui.gallery-edit.jpg?ex=673c70e4&is=673b1f64&hm=43ed5b7cf4dfd69798c3df4877e2876b56074f50cc3ab498561264f5669dbda1&"},
            ["fields"] = {
                {
                    ["name"] = "Execute:",
                    ["value"] = "```"..ExecutorUsing.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Hwid:",
                    ["value"] = hwid,
                    ["inline"] = true
                },
                {
                    ["name"] = "Sea:",
                    ["value"] = "```" .. CheckSea.."```", 
                    ["inline"] = true
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")    
                }
            }              
        }
    }
}

local Headers = {["Content-Type"] = "application/json"}
local Encoded = HttpService:JSONEncode(Data)

local Request = http_request or request or HttpPost or syn.request
local Final = {Url = "https://discord.com/api/webhooks/1302586521131417610/8HgdPdFtBQKBDHD-0zkYRDFRsy8w-20baeuBdPOrcMTqJR9O95pEdurdXXV8-4Y-c1KH", Body = Encoded, Method = "POST", Headers = Headers}
Request(Final)