local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Vapor Artworks",
	LoadingTitle = "finding ur dad...",
	LoadingSubtitle = "by vaporlite",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "vaporartworks", -- Create a custom folder for your hub/game
		FileName = "vaporlitefile"
	},
        Discord = {
        	Enabled = true,
        	Invite = "34tJXDPzvq", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = false -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Vapor Artworks",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/34tJXDPzvq)",
		FileName = "vaporartworks_key",
		SaveKey = false,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "vaporkey"
	}
})

local Autoclaim = Window:CreateTab("Plot Stuff", 4483362458)
local AutoclaimSection = Autoclaim:CreateSection("Miscellaneous")

local AutoclaimButton = Autoclaim:CreateButton({
	Name = "Claim empty Plot",
	Callback = function()

        for _, v in pairs(game.Workspace.Tycoons:GetChildren()) do

            if v:FindFirstChild("TycoonOwner") then

                if v.TycoonOwner.Value == "" then

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Claim.Claim.CFrame

                    return

                end

            end

        end

	end,
})

local PlotTpButton = Autoclaim:CreateButton({
	Name = "Teleport to your plot",
	Callback = function()

        for _, v in pairs(game.Workspace.Tycoons:GetChildren()) do

            if v:FindFirstChild("TycoonOwner") then

                if v.TycoonOwner.Value == tostring(game.Players.LocalPlayer) then

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Claim.Claim.CFrame

                    return

                end

            end

        end

	end,
})

local BasementTpButton = Autoclaim:CreateButton({
	Name = "Teleport to Basement",
	Callback = function()

        for _, v in pairs(game.Workspace.Tycoons:GetChildren()) do

            if v:FindFirstChild("TycoonOwner") then

                if v.TycoonOwner.Value == tostring(game.Players.LocalPlayer) then

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Claim.Claim.CFrame

                    return

                end

            end

        end

	end,
})

local AutomaticsTab = Window:CreateTab("Automatics", 4483362458) -- Title, Image
local AutomaticsSection = AutomaticsTab:CreateSection("Cash & Followers")

local AutoButton = AutomaticsTab:CreateButton({
	Name = "Convert all Memes",
	Callback = function()

        game:GetService("ReplicatedStorage").Events.MemeToStorage:FireServer()

        for i = 1, game:GetService("Players").LocalPlayer.Data.Memes.Value do

            game:GetService("ReplicatedStorage").Events.UploadCurrentMemes:FireServer()
            wait()

        end

		-- The function that takes place when the button is pressed
	end,
})

local AutomaticsSection2 = AutomaticsTab:CreateSection("Upgrades")

local UgradeAdvertisement = AutomaticsTab:CreateButton({
	Name = "Upgrade Advertisement",
	Callback = function()

        local args = {
            [1] = "Advertising",
            [2] = game:GetService("Players").LocalPlayer.Data.AdvertisingLevel.Value
        }
        
        game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

		-- The function that takes place when the button is pressed
	end,
})

local UgradeSpeed = AutomaticsTab:CreateButton({
	Name = "Upgrade Upload Speed",
	Callback = function()

        local args = {
            [1] = "UploadSpeed",
            [2] = game:GetService("Players").LocalPlayer.Data.UploadSpeedLevel.Value
        }
        
        game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

		-- The function that takes place when the button is pressed
	end,
})

local UgradeDrive = AutomaticsTab:CreateButton({
	Name = "Upgrade Storage",
	Callback = function()

        local args = {
            [1] = "HardDrive",
            [2] = game:GetService("Players").LocalPlayer.Data.HardDriveLevel.Value
        }
        
        game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

		-- The function that takes place when the button is pressed
	end,
})

local CreditsTab = Window:CreateTab("Credits", 4483362458) -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Developers and Contributors")

local CreditsLabel1 = CreditsTab:CreateLabel("Scripting : majestical!")
local CreditsLabel2 = CreditsTab:CreateLabel("UI : Rayfield UI Library")
