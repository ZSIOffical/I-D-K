  local  MyStand = "DxskTilIDawn"
    local SuperJumpEnabled = false
    
    getgenv().Toggled = false
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:connect(function(input,gameProcessed)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.H then
                if UIS:GetFocusedTextBox() == nil then
                    if getgenv().Toggled == false then
                        getgenv().Toggled = true
                    else
                        getgenv().Toggled = true
                    end;end;end;end;end)
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Cookies = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Roll)
    local OriginalKeyUpValue = 0
    local Anim = Instance.new("Animation" )
    Anim.AnimationId = "rbxassetid://2788290270"
    local Hover = Instance.new("Animation", game.Workspace)
    Hover.Name = "Hover"
    Hover.AnimationId = "rbxassetid://698251653"
    local LeftPunch = Instance.new("Animation",  game.ReplicatedStorage.ClientAnimations)LeftPunch.Name = "LeftPunch"
    LeftPunch.AnimationId = "rbxassetid://2788308661"
    local LeftAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.LeftPunch)
    local CoreUI = Instance.new("ScreenGui")
    local Humanoid = game.Players.LocalPlayer.Character.Humanoid
    CoreUI.Parent = game.CoreGui
    local SaveLocation = nil
    local RigWalk = nil
    local RigIdle = nil
    local InTimeErase = false
    
    local Pointing = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    Pointing.AnimationId = "rbxassetid://507770453"
    
    local UNMASKKK = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    UNMASKKK.Name = "Unmask"
    UNMASKKK.AnimationId = "rbxassetid://3380629232"
    
    local MASKKK = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    MASKKK.Name = "Mask"
    MASKKK.AnimationId = "rbxassetid://3380627692"
    
    local Poter = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(Pointing)
    Poter.Looped = true
    Poter.Priority = Enum.AnimationPriority.Action
    
    local WalkAnimation = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    WalkAnimation.AnimationId = "rbxassetid://2510198475"
    
    local Idle = Instance.new("Animation", game.ReplicatedStorage.ClientAnimations)
    Idle.AnimationId = "rbxassetid://507766388"
    
    local OldChar = LocalPlayer.Character
    local MaskAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Mask)
    local UnmaskAnim = LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Unmask)
    
    function FoV()
        local fov = coroutine.wrap(function()
            local Camera = workspace.Camera
            for i = 1, 20 do
                game.TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 8*i}):Play()
                wait(0.01)
            end
            for i = 1, 20 do
                game.TweenService:Create(Camera, TweenInfo.new(0.5), {FieldOfView = 160-i*4.5}):Play()
                wait(0.01)
            end
        end)
        fov()
    end
    
    local WalkSpeed = false
    
    local function rm()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v.Name == "OriginalPosition" then
                v:Destroy()
            elseif v.Name == "OriginalSize" then
                v:Destroy()
            elseif v.Name == "AvatarPartScaleType" then
                v:Destroy()
            end
        end
    end
    
    
    function Lighting()
        if game.Lighting:FindFirstChild("ERASE") == nil then
            local sound5 = Instance.new("Sound", CoreUI)
            sound5.Volume = 0.1
            sound5.Name = "ERASE"
            sound5.Looped = true
            sound5.SoundId = "rbxassetid://3167092959"
            sound5:Play()
    
            game.Lighting.Sky.Parent = workspace
            game:GetObjects("rbxassetid://6546113226")[1].Parent=game.Lighting
    
        else
            workspace.Sky.Parent = game.Lighting
            CoreUI:FindFirstChild("ERASE"):Destroy()
            game.Lighting:FindFirstChild("ERASE"):Destroy()
        end
    end
    
    function TimeEraseUI()
        local sound5 = Instance.new("Sound", CoreUI)
        sound5.Volume = 0.1
        sound5.SoundId = "rbxassetid://6546128175"
        sound5:Play()
    
        local Image = Instance.new("ImageLabel", CoreUI)
        Image.Image = "http://www.roblox.com/asset/?id=6546043746"
        Image.BackgroundTransparency = 1
        Image.AnchorPoint = Vector2.new(0.5, 0.5)
        Image.Size = UDim2.fromScale(1, 1)
        Image.Position = UDim2.fromScale(-0.5, 0.5)
        delay(0, function()
            for i = 0, 1, 0.1 do
                Image.Position = UDim2.fromScale(-Image.Position.X.Scale+i, 0.5)
                Image.ImageTransparency = Image.ImageTransparency+i
                wait(.01)
            end
            Image:Destroy()
            sound5:Destroy()
        end)
    end
    
    
    function ModelCharacter()
        if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") == nil then
            local MODEL = Instance.new("Model", workspace)
            MODEL.Name = LocalPlayer.Name.."StringKOD"
    
            OldChar.Humanoid:UnequipTools()
    
            for i, v in pairs(OldChar:GetChildren()) do 
                if (v:IsA("BasePart")  or v:IsA("MeshPart")) and v.Parent:FindFirstChildOfClass("Humanoid") and v.Name ~= "HumanoidRootPart" then
                    local Part = v:Clone()
                    Part.Parent = MODEL
                    Part.Name = v.Name
                    Part.Material = Enum.Material.ForceField
                    Part.CFrame = v.CFrame
                    Part.Transparency = 0.5 
                    Part.BrickColor = BrickColor.Red()
                    Part.CanCollide = false
                    Part.Anchored = true
                    for i, v  in pairs(Part:GetChildren()) do 
                        if v.ClassName ~= "SpecialMesh" then
                            v:Destroy()
                        end
                    end
                end
            end
            local NewCharacter = game:GetObjects("rbxassetid://6547055500")[1]
            NewCharacter.Parent = MODEL
            NewCharacter.Name = "Idaro"
    
            workspace.Camera.CameraSubject = NewCharacter.Humanoid
            SaveLocation = OldChar.HumanoidRootPart.CFrame
            InTimeErase = true
            NewCharacter.HumanoidRootPart.CFrame = SaveLocation
    
            RigIdle = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(Idle)
            RigIdle.Looped = true
            RigIdle.Priority = Enum.AnimationPriority.Action
            RigWalk = NewCharacter:WaitForChild("Humanoid"):LoadAnimation(WalkAnimation)
            RigWalk.Looped = true
            RigWalk.Priority = Enum.AnimationPriority.Action
            WalkSpeed = true
            RigIdle:Play()
        else
            InTimeErase = false
            WalkSpeed = false
            workspace.Camera.CameraSubject =  OldChar.Humanoid
            OldChar.HumanoidRootPart.CFrame =  workspace:FindFirstChild(LocalPlayer.Name.."StringKOD").Idaro.HumanoidRootPart.CFrame
            workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):Destroy()
        end
    end
    
    function Slide()
        local XD = OldChar.Humanoid:LoadAnimation(Anim)
        XD:Play()
        XD.TimePosition = 0.15
        XD.Looped = false
        XD:AdjustSpeed(1.1)
    end
    
    function AddVelocity(Vel, Char)
        Char.HumanoidRootPart.Velocity = Char.HumanoidRootPart.Velocity+Vel
    end
    
    local IsJump = false
    
    function Jumping()
        if IsJump == false then
            return false
        else
            return true
        end
    end
    
    local Mouse = LocalPlayer:GetMouse()
    
    local MoveDirection = Vector3.new(0,0,0)
    local WSpped = 0 
    local LeftSpeed = 0
    local UpSpeed = 0
    
    function IdleRigXD()
        if RigIdle and RigWalk.IsPlaying and WSpped == 0 and LeftSpeed == 0 and UpSpeed == 0 then
            RigIdle:Play()
            RigWalk:Stop()
        end
    end
    
    function WalkRigXD()
        if RigWalk and RigIdle.IsPlaying then
            RigIdle:Stop()
            RigWalk:Play()
        end
    end
    
    Mouse.KeyDown:Connect(function(KeyDownXD)
        if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") then
            if KeyDownXD == "w" then
                WSpped = -1
                WalkRigXD()
            elseif KeyDownXD == "a" then
                LeftSpeed = -1
                WalkRigXD()
            elseif KeyDownXD == "d" then
                LeftSpeed = 1
                WalkRigXD()
            elseif KeyDownXD == "s" then
                WSpped = 1
                WalkRigXD()
            end
        end
    end)
    
    Mouse.KeyUp:Connect(function(KeyDownXD)
        if KeyDownXD == "w" then
            WSpped = 0
            IdleRigXD()
        elseif KeyDownXD == "a" then
            LeftSpeed = 0
            IdleRigXD()
        elseif KeyDownXD == "d" then
            LeftSpeed = -0
            IdleRigXD()
        elseif KeyDownXD == "s" then
            WSpped = 0
            IdleRigXD()
        end
    end)
    
    local CD = false
    local uis = game:GetService("UserInputService")
    
    uis.InputBegan:Connect(function(i, XD)
        if i.KeyCode == Enum.KeyCode.H and XD == false then
            if SuperJumpEnabled == false then
                SuperJumpEnabled = true
            elseif SuperJumpEnabled == true then
                SuperJumpEnabled = false
            end
        end
    end)
    
    uis.InputBegan:Connect(function(i, XD)
        if i.KeyCode == Enum.KeyCode.Space and XD == false then
            if workspace:FindFirstChild(LocalPlayer.Name.."StringKOD") == nil then
                if Jumping() == true and not Poter.IsPlaying then
                    AddVelocity(OldChar.HumanoidRootPart.CFrame.LookVector*150, OldChar)
                    IsJump = false
                    Cookies:Stop()
                    CD = true
                    Slide()
                    repeat wait() until workspace:FindPartOnRayWithWhitelist(Ray.new(OldChar.HumanoidRootPart.Position, Vector3.new(0, -4 * OldChar.HumanoidRootPart.Size.y, 0)), { workspace.MAP })
                    CD = false
                end
            else
                workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):FindFirstChild("Idaro").Humanoid:ChangeState(3)
            end
        end
    end)
    
    function StopAudio()
        OldChar.LowerTorso.BOOMBOXSOUND:Stop()
    end
    
    function stop(ID, Key)
        local cor = coroutine.wrap(function()
            wait(OldChar.LowerTorso.BOOMBOXSOUND.TimeLength-0)
            if OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
                StopAudio()
            end
        end)
        cor()
    end
    
    
    function play(ID, STOP, LMAO)
        if LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
            local Tool = nil
            if OldChar:FindFirstChildOfClass("Tool") and LMAO == true then
                Tool = OldChar:FindFirstChildOfClass("Tool")
                OldChar:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
            end
            LocalPlayer.Backpack["[Boombox]"].Parent =
                OldChar
            game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
            OldChar["[Boombox]"].RequiresHandle = false
            if OldChar["[Boombox]"]:FindFirstChild("Handle") then
                OldChar["[Boombox]"].Handle:Destroy()
            end
            OldChar["[Boombox]"].Parent =
                LocalPlayer.Backpack
            LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
            if Tool ~= true then
                if Tool then
                    Tool.Parent = OldChar
                end
            end
            if STOP == true then
                OldChar.LowerTorso:WaitForChild("BOOMBOXSOUND")
                local cor = coroutine.wrap(function()
                    repeat wait() until OldChar.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OldChar.LowerTorso.BOOMBOXSOUND.TimeLength > 0
                    OriginalKeyUpValue = OriginalKeyUpValue+1
                    stop(ID, OriginalKeyUpValue)
                end)
                cor()
            end
        end
    end
    
    local bro = false
    local TimeErase, CanCel = "Time erase!", "Time erase!"
    local TimeStop, TimeResume = "Time stop!", "Time stop!"
    local XD = false
    LocalPlayer.Chatted:Connect(function(MSG)
        if MSG == "Rage!" then
    if Humanoid:FindFirstChild("HeadScale") then
        rm()
        wait(0.6)
    
        Humanoid:FindFirstChild("HeadScale"):Destroy()
        wait(0.6)
    end
    
    
    if Humanoid:FindFirstChild("BodyWidthScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
        wait(0.6)
    end
    
    
    
    if Humanoid:FindFirstChild("BodyDepthScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
        wait(0.6)
    end
    
    
    
    if Humanoid:FindFirstChild("BodyTypeScale") then
        rm()
        wait(0.6)
        Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
       wait(0.6)
    end
        elseif MSG == CanCel and XD == true and not Poter.IsPlaying then
            XDDDD(XD)
        elseif MSG == TimeStop then
            play(6947054675, true, true)
            wait(0.3)
            OldChar.LowerTorso.BOOMBOXSOUND.SoundId = "http://www.roblox.com/asset/?id=wd"
            wait(0.1)
            play(7084712646, true, true)
        end
    end)
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(obj)
    if obj.KeyCode == Enum.KeyCode.E and XD == false and not Poter.IsPlaying then
            XDDDD(XD)
    end
    function XDDDD(XDR)
        if XDR == false then
            XD = true
            play(6546133414, true, true)
            wait()
            TimeEraseUI()
            FoV()
            Lighting()
            ModelCharacter()
        else
            XD = false
            InTimeErase = false
            wait(0.1)
            play(6543435253, true, true)
            TimeEraseUI()
            ModelCharacter()
            Lighting()
            FoV()
    end
    end
    
    function Jump(...)
        (...).Jumping:Connect(function()
            if SuperJumpEnabled == true then
            if CD == false and not Poter.IsPlaying then
                CD = true
                delay(1, function()
                    CD = false
                end)
                Cookies:Play(0, 1, 1.4)
                AddVelocity(OldChar.HumanoidRootPart.CFrame.UpVector*120, OldChar)
                delay(0, function()
                    IsJump = true
                    wait(1) 
                    if IsJump == true then
                        IsJump = false
                    end
                end)
                end
            end
        end)
    end
    
    
    Jump(OldChar.Humanoid)
    
    LocalPlayer.CharacterAdded:Connect(function(Character)
        wait(1)
        if Character.Name == LocalPlayer.Name then
            Jump(Character.Humanoid)
            Poter = Character:WaitForChild("Humanoid"):LoadAnimation(Pointing)
            Poter.Looped = true
            Poter.Priority = Enum.AnimationPriority.Action
    
            Cookies = Character:WaitForChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.ClientAnimations.Roll)
            OldChar = Character
        end
    end)
    
    game["Run Service"].Heartbeat:Connect(function()
        if InTimeErase then
            for i, v in pairs(OldChar:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CFrame = CFrame.new(math.random(200, 500), math.random(200, 500), math.random(200, 500))
                    v.Velocity = Vector3.new(0,0,0)
                end
            end
    
            if OldChar:FindFirstChild("Combat") and XD == true then
                XD = false
                XDDDD(true)
            end
    
            if WalkSpeed == true then
                MoveDirection = Vector3.new(LeftSpeed, UpSpeed, WSpped)
                workspace:FindFirstChild(LocalPlayer.Name.."StringKOD"):FindFirstChild("Idaro").Humanoid:Move(MoveDirection, true)
            end
        else
            if OldChar:FindFirstChild("[Flashlight]") then
                if workspace.Players:FindFirstChild(MyStand) then
                    if not Poter.IsPlaying then
                        Poter:Play()
                        Poter:AdjustSpeed(0)
                        Poter.TimePosition = 1.2
                    end
                    local lol = workspace.Players:FindFirstChild(MyStand).HumanoidRootPart.CFrame * CFrame.new(0, 0.5, 1.25)
                    OldChar.HumanoidRootPart.CFrame = lol
                end
            else
                if Poter.IsPlaying then
                    Poter:Stop()
                end
            end
        end
    end)
   
    end)
local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(obj)
        if obj.KeyCode == Enum.KeyCode.Q then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').HipHeight = 10
            
        elseif obj.KeyCode == Enum.KeyCode.F then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').HipHeight = 1.8
        end
    end)
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    
superhuman = false
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)				
		if key == "z" and superhuman == false then
			superhuman = true
			game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
			game.Players.LocalPlayer.Character.Humz.WalkSpeed = 100
			game.Players.LocalPlayer.Character.Humz.JumpPower = 200
		elseif key == "z" and superhuman == true then
			superhuman = false
			game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humz.JumpPower = 50
			game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
		end

	end)

rconsoleprint("\n Script remade by SoloDev (I skidded from an exisiting one that isnt public and added some stuff lol)")
