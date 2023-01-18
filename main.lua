
local CgLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CGB-CoolGamerBoy/CG-Lib/master/src.lua"))()


-- load Data Tables
local UserBase = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/Users.lua", true))()
local BanUserBase = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/UsersBanned.lua"))()



-- Retrieve User Data and Open Table



local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local GUI = CgLib:Create{
    Name = "Hakrrboiii API", -- GUI Name
    Size = UDim2.fromOffset(1600, 750),
    Theme = CgLib.Themes.Dark,
    Link = "discord.gg/8NbwAuBTjm/" -- The link you want to display in the GUI. Ex: https://github.com/CGB-CoolGamerBoy/CG-Lib
}

local Tab = GUI:Tab{
	Name = "Key System",
	Icon = "rbxassetid://5743022896"
}

Tab:Textbox{
	Name = "Key",
	Callback = function(text) 
            if text == "C9fMkcmuGpWKbeKj" then
                SendNotification("HakrrAPI", "Correct Key!", 5)
                
                wait(5)
                
                local TeleportService = game:GetService("TeleportService")
                SendNotification("HakrrAPI", "Closing Login", 5)
                TeleportService.TeleportToPlaceInstance(TeleportService, game.PlaceId, game.JobId)
            
            elseif text == "" then
                SendNotification("HakrrAPI", "Blank Key", 5)
            else
                SendNotification("HakrrAPI", "Incorrect Key!", 5)
            end 
        end
}



for i,v in pairs(UserBase) do
    if v == HWID then
        -- Execute Key System Script & Send Cg-Lib Notification
        
        wait(2)
        SendNotification("HakrrAPI", "User Verified!", 5)
        wait(5)
        
        wait(5)
    else
        -- Send Cg-Lib Notification
        SendNotification("HakrrAPI", "You are not whitelisted. Please register now", 5)
        -- Create ticket in Discord to reset HWID
        wait(10)
        SendNotification("HakrrAPI", "Check our Discord server to register", 5)
    end
end

for i,v in pairs(BanUserBase) do 
    if v == HWID then 
        game.Players.LocalPlayer:Kick("Blacklisted")
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

