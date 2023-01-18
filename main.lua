
local CgLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CGB-CoolGamerBoy/CG-Lib/master/src.lua"))()


-- load Data Tables
local UserBase = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/Users.lua", true))()

-- local data = game:GetService("HttpService"):JSONEncode(UserBase)
local data = json.decode(UserBase)

-- Retrieve User Data and Open Table

local whitelist = data.Whitelisted
local blacklist = data.Blacklisted

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
            if text == WlKey then
                SendNotification("HakrrAPI", "Correct Key!", 5)
            elseif text == "" then
                SendNotification("HakrrAPI", "Blank Key", 5)
            else
                SendNotification("HakrrAPI", "Incorrect Key!", 5)
            end 
        end
}



for i,v in pairs(whitelist) do
    if v == HWID then
        -- Execute Key System Script & Send Cg-Lib Notification
        S
        wait(2)
        
        wait(5)
        GUI:Destroy()
        wait(5)
    else
        -- Send Cg-Lib Notification
        
        -- Create ticket in Discord to reset HWID
        wait(10)
        game.Players.LocalPlayer:Kick("You are not whitelisted")
    end
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

