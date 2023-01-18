-- Required locals

Webhook_URL = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/Webhook.lua"))()
HttpService = game:GetService("HttpService")
local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local DiscordUrl = "discord.gg/8NbwAuBTjm"
local KeyList = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/keys.lua"))()

-- Player and Game/Client Info --

local LocalPlayer = game.Players.LocalPlayer

local Player = game.Players.LocalPlayer.Name
local PlayerId = LocalPlayer.UserId
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local RobloxUrl = "https://roblox.com/"
local GameUrl = RobloxUrl.."games/"..game.PlaceId
local ProfileUrl = RobloxUrl.."profile/"..game.Players.LocalPlayer.UserId
local GameValue = "["..Asset.Name.."]("..GameUrl..")"
local KeyList = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/keys.lua"))()
local Key = math.random(1, #KeyList)

-- Exploit Info --

local exploitcheck =
   syn and "Synapse X" or
   KRNL_LOADED and "KRNL" or
   getexecutorname() and "Script Ware" or "Fluxus"

local exploiturl =
    syn and "https://x.synapse.to" or
	KRNL_LOADED and "https://krnl.place" or 
    getexecutorname() and "https://scriptware.com" or "https://fluxteam.net" 

local ExpValue = 
    "["..exploitcheck.."]("..exploiturl..")"


local TicketMsg =
	"Roblox Username: "..Player.."("..PlayerId..")\n\n"..
	"License: **"..HWID.."**\n\n"..
    "Code: "..KeyList[Key]
	
-- Functions After HttpReq'

function Result() 
	wait(2)
	game:GetService("GuiService"):OpenBrowserWindow("https://google.com")
    if syn or KRNL_LOADED or identifyexecutor() then
        _G.discord_invite = "8NbwAuBTjm"
		loadstring(game:HttpGet("https://cgb-coolgamerboy.github.io/CGB-CoolGamerBoy/CGBHub/Discord.lua", true))()
    end
end




-- Http Info

function Http(HttpReq)
    if syn then 
        syn.request(HttpReq)
    elseif identifyexecutor() then
        request(HttpReq)
    elseif KRNL_LOADED then
        request(HttpReq)
    else    
        game.Players.LocalPlayer:Kick("CGB Error: 1")
    end
end

local url = Webhook_URL
local msgData = {
    ["content"] = '@everyone',
    ["embeds"] = {{
        ["title"] = "**CGB User Detected**",
        ["description"] = "["..Player.."]("..ProfileUrl..") has executed CGB Hub",
        ["type"] = "rich",
        ["color"] = tonumber(0xffffff),
        ["fields"] = {
            {
                ["name"] = "Hardware ID:",
                ["value"] = HWID,
                ["inline"] = false
            },
            {
                ["name"] = "Executor:",
                ["value"] = ExpValue,
                ["inline"] = true
            },
            {
                ["name"] = "Executed In:",
                ["value"] = GameValue,
                ["inline"] = true
            },
            {
                ["name"] = "Security Code: ",
                ["value"] = KeyList[Key],
                ["inline"] = true
            }
        }
    }}
}
local newdata = game:GetService("HttpService"):JSONEncode(msgData)

local headers = {
   ["content-type"] = "application/json"
}

local sendMsg = {Url = url, Body = newdata, Method = "POST", Headers = headers}

Http(sendMsg)
wait(5)
Result()