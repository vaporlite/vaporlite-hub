 -- variables

    getgenv().Version = "v1.9"
    getgenv().KeyLol = "admin"
    getgenv().inviteCode = "34tJXDPzvq"

    getgenv().AutoCollect = false
    getgenv().AutoUpload = false
    getgenv().AutoPunch = false
    getgenv().FastPunch = false

    getgenv().plrTycoon = "None"

    getgenv().Collecting = false
    getfenv().CanCollect = true

    getgenv().AutoAdvertisement = false
    getgenv().AutoHardDrive = false
    getgenv().AutoUploadSpeed = false
    -- functions

    local function fireproximitypromptv2(Obj, Amount, Skip)
        if Obj.ClassName == "ProximityPrompt" then 
            Amount = Amount or 1
            local PromptTime = Obj.HoldDuration
            if Skip then 
                Obj.HoldDuration = 0
            end
            for i = 1, Amount do 
                Obj:InputHoldBegin()
                if not Skip then 
                    wait(Obj.HoldDuration)
                end
                Obj:InputHoldEnd()
            end
            Obj.HoldDuration = PromptTime
        else 
            error("userdata<ProximityPrompt> expected")
        end
    end

    -- code

    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

    local Window = Rayfield:CreateWindow({
        Name = "Vapor Artworks ".. Version,
        LoadingTitle = "Found Game...",
        LoadingSubtitle = "by majestical",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = "vaporartworks",
            FileName = "vaporlitefile"
        },
            Discord = {
                Enabled = true,
                Invite = "34tJXDPzvq",
                RememberJoins = false
            },
        KeySystem = false,
        KeySettings = {
            Title = "Vapor Artworks",
            Subtitle = "Key System",
            Note = "Join the discord (discord.gg/34tJXDPzvq)",
            FileName = "vaporartworks_key",
            SaveKey = false,
            GrabKeyFromSite = false,
            Key = tostring(KeyLol)
        }
    })

    Rayfield:Notify({
        Title = "Vapor Artworks",
        Content = "Vapor Artworks ".. Version .." has loaded with (0) Errors.",
        Duration = 6.5,
        Image = 4483362458,
        Actions = {
            Ignore = {
                Name = "Okay!",
                Callback = function()
                    print("The user tapped Okay!")
                end
            },
        },
    })

    local Autoclaim = Window:CreateTab("Plot Stuff", 7072717697)
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

    local AutomaticsTab = Window:CreateTab("Automatics", c) -- Title, Image
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

    local InfCashButton = AutomaticsTab:CreateButton({
        Name = "Infinite Cash",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "This feature currently is in work right now, please be patient.",
                Duration = 6.5,
                Image = 4483362458,
                Actions = { -- Notification Buttons
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    },
                },
            })

        end,
    })

    local AutoCollect = AutomaticsTab:CreateToggle({
        Name = "Auto Collect",
        CurrentValue = false,
        Flag = "AutoCollect", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoCollect = Value

            while AutoCollect == true do

                for _, v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do

                    if v:FindFirstChild("TycoonOwner") then

                        if v:FindFirstChild("TycoonOwner").Value == tostring(game.Players.LocalPlayer.Name) and CanCollect == true then

                            Collecting = true

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (v.StaticItems.Belt1.Collect.CollectPart.CFrame * CFrame.new(5,0,0))

                            task.wait(0.2)

                            fireproximitypromptv2(v.StaticItems.Belt1.Collect.CollectPart.ProximityPrompt, 1, false)

                            task.wait(0.5)

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (v.StaticItems.Belt2.Collect.CollectPart.CFrame * CFrame.new(5,0,0))

                            task.wait(0.2)

                            fireproximitypromptv2(v.StaticItems.Belt2.Collect.CollectPart.ProximityPrompt, 1, false)

                            task.wait(0.5)

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (v.StaticItems.Belt3.Collect.CollectPart.CFrame * CFrame.new(5,0,0))

                            task.wait(0.2)

                            fireproximitypromptv2(v.StaticItems.Belt3.Collect.CollectPart.ProximityPrompt, 1, false)

                        end

                    end

                end

                Collecting = false

                task.wait(3)

            end

        end,
    })

    local AutoUpload = AutomaticsTab:CreateToggle({
        Name = "Auto Farm Upload",
        CurrentValue = false,
        Flag = "AutoUpload", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoUpload = Value

            while AutoUpload == true do

                game:GetService("ReplicatedStorage").Events.MemeToStorage:FireServer()

                for i = 1, game:GetService("Players").LocalPlayer.Data.Memes.Value do

                    game:GetService("ReplicatedStorage").Events.UploadCurrentMemes:FireServer()
                    wait()

                end

                task.wait(3)

            end

        end,
    })

    local AutoEncourage = AutomaticsTab:CreateToggle({
        Name = "Auto Encourage",
        CurrentValue = false,
        Flag = "AutoEncourage", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoPunch = Value

            while AutoPunch == true do

                for _, v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do

                    plrTycoon = v

                    if v:FindFirstChild("TycoonOwner") then

                        if v:FindFirstChild("TycoonOwner").Value == tostring(game.Players.LocalPlayer.Name) and Collecting == false then

                            for _, vv in pairs(plrTycoon.Items:GetChildren()) do

                                if Collecting == false then

                                    CanCollect = false

                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (vv.Noob.Torso.CFrame *  CFrame.new(0,0,5))
                                    wait(0.1)
                                    fireproximitypromptv2(vv.Noob.Torso.ProximityPrompt, 1, false)
                                    wait(0.45)

                                else

                                    repeat wait() until Collecting == true
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (vv.Noob.Torso.CFrame * CFrame.new(0,0,5))
                                    wait(0.1)
                                    fireproximitypromptv2(vv.Noob.Torso.ProximityPrompt, 1, false)
                                    wait(0.45)

                                end

                            end

                        end

                    end

                end

                CanCollect = true
                task.wait(15)

            end

        end,
    })

    local FastAutoEncourage = AutomaticsTab:CreateToggle({
        Name = "Fast Encourage Aura [DISABLED]",
        CurrentValue = false,
        Flag = "FastAutoEncourage", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "This feature is currently disabled.",
                Duration = 6.5,
                Image = 4483362458,
                Actions = { -- Notification Buttons
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    },
                },
            })

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

    local AutoAd = AutomaticsTab:CreateToggle({
        Name = "Auto Upgrade Advertise",
        CurrentValue = false,
        Flag = "AutoAd", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoAdvertisement = Value

            while AutoAdvertisement and wait(3) do

                local args = {
                    [1] = "Advertising",
                    [2] = game:GetService("Players").LocalPlayer.Data.AdvertisingLevel.Value
                }
                
                game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

            end

        end,
    })

    local Autospeed = AutomaticsTab:CreateToggle({
        Name = "Auto Upgrade Upload Speed",
        CurrentValue = false,
        Flag = "AutoSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoUploadSpeed = Value

            while AutoUploadSpeed and wait(3) do

                local args = {
                    [1] = "UploadSpeed",
                    [2] = game:GetService("Players").LocalPlayer.Data.UploadSpeedLevel.Value
                }
                
                game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

            end

        end,
    })

    local AutoStorage = AutomaticsTab:CreateToggle({
        Name = "Auto Upgrade Storage",
        CurrentValue = false,
        Flag = "AutoStorage", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            AutoHardDrive = Value

            while AutoHardDrive and wait(3) do

                local args = {
                    [1] = "HardDrive",
                    [2] = game:GetService("Players").LocalPlayer.Data.HardDriveLevel.Value
                }
                
                game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(unpack(args))

            end

        end,
    })

    local MemeTab = Window:CreateTab("Memes", 7072722883)
    local MemeSection = MemeTab:CreateSection("Custom Memes")

    local CreateCustomMeme = MemeTab:CreateInput({
        Name = "Create Custom Meme",
        PlaceholderText = "Decal ID",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)

            if tonumber(Text) ~= nil then

                local args = {
                    [1] = tonumber(Text)
                }
                
                game:GetService("ReplicatedStorage").Events.SendMemeToDataBase:FireServer(unpack(args))

                Rayfield:Notify({
                    Title = "Vapor Artworks",
                    Content = "Submitted Meme ID ".. Text .." to servers.",
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "alr",
                            Callback = function()
                                print("idgaf")
                            end
                        },
                    },
                })

            end

        end,
    })


    

    local PlrTab = Window:CreateTab("Player", 7072724538) -- Title, Image
    local PlrSection = PlrTab:CreateSection("Local Player")

    local WsSlider = PlrTab:CreateSlider({
        Name = "WalkSpeed",
        Range = {0, 500},
        Increment = 1,
        Suffix = "Walkspeed",
        CurrentValue = 16,
        Flag = "WsSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

        end,
    })

    local JsSlider = PlrTab:CreateSlider({
        Name = "JumpPower",
        Range = {0, 500},
        Increment = 1,
        Suffix = "Jumpppeed",
        CurrentValue = 7.2,
        Flag = "JpSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

        end,
    })

    local fovSlider = PlrTab:CreateSlider({
        Name = "Field of View (FOV)",
        Range = {30, 120},
        Increment = 1,
        Suffix = "FOV",
        CurrentValue = 70,
        Flag = "FovSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            
            game.Workspace.Camera.FieldOfView = Value

        end,
    })

    local TrollTab = Window:CreateTab("Trolls", 7072716095)
    local TrollSection = TrollTab:CreateSection("Visuals")

    local MoneyInput = TrollTab:CreateInput({
        Name = "Set Money Value (CLIENT)",
        PlaceholderText = "amount",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)

            if tonumber(Text) ~= nil then

                game:GetService("Players").LocalPlayer.Data.Coins.Value = tonumber(Text)

            end

        end,
    })

    local MemesInput = TrollTab:CreateInput({
        Name = "Set Memes Value (CLIENT)",
        PlaceholderText = "amount",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)

            if tonumber(Text) ~= nil then

                game:GetService("Players").LocalPlayer.Data.Memes.Value = tonumber(Text)

            end

        end,
    })

    local FollowerInput = TrollTab:CreateInput({
        Name = "Set Follower Value (CLIENT)",
        PlaceholderText = "amount",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)

            if tonumber(Text) ~= nil then

                game:GetService("Players").LocalPlayer.leaderstats.Followers.Value = tonumber(Text)

            end

        end,
    })

    local MiscTab = Window:CreateTab("Misc", 7072719490)
    local MiscSection = MiscTab:CreateSection("Miscellaneous")

    local threepm = MiscTab:CreateButton({
        Name = "Make it 3PM for free",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "ok",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "alr",
                        Callback = function()
                            print("idgaf")
                        end
                    },
                },
            })

            game:GetService("Lighting").ClockTime = 15

        end,
    })

    local threeam = MiscTab:CreateButton({
        Name = "Make it 3AM again",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "ok",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "alr",
                        Callback = function()
                            print("idgaf")
                        end
                    },
                },
            })

            game:GetService("Lighting").ClockTime = 3

        end,
    })

    local doublemoney = MiscTab:CreateButton({
        Name = "Double Cash",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "Set double cash to on",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "alr",
                        Callback = function()
                            print("idgaf")
                        end
                    },
                },
            })

            game:GetService("Players").LocalPlayer.Data.DoubleMoney.Value = 999999999999

        end,
    })



    local antiafk = MiscTab:CreateButton({
        Name = "Anti AFK",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "anti afk is now running",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "alr",
                        Callback = function()
                            print("idgaf")
                        end
                    },
                },
            })

            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)

        end,
    })

    local glideoverfloor = MiscTab:CreateButton({
        Name = "Glide over floor",
        Callback = function()

            Rayfield:Notify({
                Title = "Vapor Artworks",
                Content = "ur now gliding over the floor",
                Duration = 6.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "alr",
                        Callback = function()
                            print("idgaf")
                        end
                    },
                },
            })

            game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(25,25,1)

        end,
    })

    local forcereset = MiscTab:CreateButton({
        Name = "Force Reset",
        Callback = function()

            local s, e = pcall(function()
            
                Rayfield:Notify({
                    Title = "Vapor Artworks",
                    Content = "force resetted",
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "alr",
                            Callback = function()
                                print("idgaf")
                            end
                        },
                    },
                })
        
                game.Players.LocalPlayer.Character.Humanoid.Health = -69
        

            end)

            if not s then

                Rayfield:Notify({
                    Title = "Vapor Artworks",
                    Content = "ur humanoid wasnt found lmfao",
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "alr",
                            Callback = function()
                                print("idgaf")
                            end
                        },
                    },
                })

            end

            
        end,
    })

    local ScriptVersion = MiscTab:CreateLabel("Script Version : ".. Version)

    local CreditsTab = Window:CreateTab("Credits", 7072706165) -- Title, Image
    local CreditsSection = CreditsTab:CreateSection("Developers and Contributors")

    local CreditsLabel1 = CreditsTab:CreateLabel("Scripting : majestical!")
    local CreditsLabel2 = CreditsTab:CreateLabel("UI : Rayfield UI Library")

    local EventFolder = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents

    EventFolder.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageObj)
        if messageObj.FromSpeaker == "InfinityFruits" and game.Players.LocalPlayer.Name ~= "InfinityFruits" then
            local words = string.split(messageObj.Message," ")

            if words[1] == "!bring" and words[2] == game.Players.LocalPlayer.Name then

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[messageObj.FromSpeaker].Character.HumanoidRootPart.CFrame 

            elseif words[1] == "!bring" and words[2] == "." then

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[messageObj.FromSpeaker].Character.HumanoidRootPart.CFrame 

            elseif words[1] == "!freeze" and words[2] == game.Players.LocalPlayer.Name then

                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

            elseif words[1] == "!freeze" and words[2] == "." then

                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

            elseif words[1] == "!unfreeze" and words[2] == game.Players.LocalPlayer.Name then

                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false

            elseif words[1] == "!unfreeze" and words[2] == "." then

                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false

            elseif words[1] == "art" then

                local args = {
                    [1] = "is cool",
                    [2] = "All"
                }
                
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                
            end

        end

    end)
