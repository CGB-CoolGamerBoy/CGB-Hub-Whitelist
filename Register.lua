-- Required locals

Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"
HttpService = game:GetService("HttpService")
local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local DiscordUrl = "discord.gg/8NbwAuBTjm"
local KeyList = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/keys.lua"))()

-- Player and Game/Client Info --

local Player = game.Players.LocalPlayer.Name
local PlayerId = game.Players.LocalPlayer.UserId
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
	if KRNL_LOADED then
		rconsoleclear()
		rconsolename("Krnl | CGB")
	elseif syn then
		rconsoleclear()
		rconsoletitle("Synapse X | CGB")
		rconsoleinfo("[Syn] Console Loaded\n\n\n")
		wait(5)
		rconsoleclear()
	elseif identifyexecutor() then
		rconsoleclear()
		rconsoletitle("["..identifyexecutor().."] Console Loaded")
		wait(5)
		rconsoleclear()
	end
	rconsoleprint("[CGB] ")
	rconsoleprint("@@RED@@")
	rconsoleprint("Discord: "..DiscordUrl)
	rconsoleprint("\n")
	wait(2)
	rconsoleprint("@@WHITE@@")
	rconsoleprint("[CGB] Discord has been copied")
	wait(1)
	rconsoleprint("\n")
	rconsoleprint("[CGB] Please create a ticket in Discord to finish registration")
	rconsoleprint("\n\n")
	rconsoleprint(TicketMsg)
end

function DisInfo()
    if syn or identifyexecutor() then
        Result()
        wait(5)
        setclipboard(TicketMsg)		
    elseif KRNL_LOADED then
		Result()
		setclipboard(TicketMsg)
		wait(30)
		rconsoleclose()
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
wait(10)
DisInfo()