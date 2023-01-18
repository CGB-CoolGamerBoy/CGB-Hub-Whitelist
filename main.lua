local json = require("JSON")

local function LoadLibrary(libraryString)
	local success, library = pcall(loadstring(libraryString))
	if success then
		return library
	else
		error(library)
	end
end


local http = game:GetService("HttpService")
local libraryString = http:GetAsync("https://raw.githubusercontent.com/CGB-CoolGamerBoy/CG-Lib/master/src.lua")


local CgLib = LoadLibrary(libraryString)


-- load Data Tables
local UserBase = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/UserData.json", true))()
local data = json.decode(UserBase)

-- Retrieve User Data and Open Table
local localUserName = data.Users[localUserName]
local localHWID = localUserName[HWID]
local isBlacklisted = localUserName[isBlacklisted]
local reason = localUserName[blReason]
local localUserData = data.Users[localUserName]
local WlKey = localUserData[Key]


local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local GUI = CgLib:Create{
    Name = "Hakrrboiii API", -- GUI Name
    Size = UDim2.fromOffset(1, 0, 1, 0),
    Theme = CgLib.Themes.Dark,
    Link = "discord.gg/8NbwAuBTjm" -- The link you want to display in the GUI. Ex: https://github.com/CGB-CoolGamerBoy/CG-Lib
}

local Tab = GUI:Tab{
	Name = "Key System",
	Icon = "rbxassetid://5743022896"
}

Tab:Textbox{
	Name = "Textbox",
	Callback = function(text) 
             if text == WlKey
                SendNotification("HakrrAPI", "Correct Key!", 5)
        end
}

if localUserData then
    print("[Auth] " .. localUserName .. "  was found")

    if userData.HWID == HWID then
        print("[Auth] User found; HWID matched")

        if isBlacklisted == false 
            print("[Auth] User is licensed")

            SendNotification("HakrrAPI", "Whitelisted!")

        else
            SendNotification("HakrrAPI", localUserName .. ", you are blacklisted", 5)
            SendNotification("HakrrAPI", reason, 10)

            wait(30)

            game.Players.LocalPlayer:Kick("Blacklist reason: " .. reason)
        end

        return true
    else
        print("[Auth] User found; HWID mismatched")
        return false
    end
else
    print("[Auth] " .. localUserName .. " was not found")
    
    SendNotification("HakrrAPI", "User not found", 5)
    loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/Register.lua"))()
    return false
end

function SendNotification(Title, Text, Duration)
	GUI:Notification{
		Title = Title,
		Text = Text,
		Duration = Duration,
		Callback = function() 
			
		end
	}
end

