local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Soloware",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "discord.gg/DecprpBAYa"
}
local Tab = GUI:Tab{
	Name = "Aiming",
	Icon = "rbxassetid://7170319773"
}
Tab:Button{
	Name = "Silent aim",
	Description = nil,
	Callback = function() 
		loadstring(game:HttpGet("https://pastebin.com/raw/8J5R74fT"))()
	end
}
Tab:Button{
	Name = "Aimlock [Q]",
	Description = nil,
	Callback = function() 
        getgenv().AimPart = "HumanoidRootPart"
		getgenv().AimlockKey = "q"
		
		getgenv().AimRadius = 30
		
		getgenv().ThirdPerson = true
		
		getgenv().FirstPerson = true
		
		getgenv().TeamCheck = false
		getgenv().PredictMovement = true
		
		getgenv().PredictionVelocity = 9
		local L_27_, L_28_, L_29_, L_30_ =
			game:GetService "Players",
		game:GetService "UserInputService",
		game:GetService "RunService",
		game:GetService "StarterGui"
		local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
			L_27_.LocalPlayer,
		L_27_.LocalPlayer:GetMouse(),
		workspace.CurrentCamera,
		CFrame.new,
		Ray.new,
		Vector3.new,
		Vector2.new
		local L_38_, L_39_, L_40_ = true, false, false
		local L_41_
		getgenv().CiazwareUniversalAimbotLoaded = true
		getgenv().WorldToViewportPoint = function(L_42_arg0)
			return L_33_:WorldToViewportPoint(L_42_arg0)
		end
		getgenv().WorldToScreenPoint = function(L_43_arg0)
			return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
		end
		getgenv().GetObscuringObjects = function(L_44_arg0)
			if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
				local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
				if L_45_ then
					return L_45_:IsDescendantOf(L_44_arg0)
				end
			end
		end
		getgenv().GetNearestTarget = function()
			local L_46_ = {}
			local L_47_ = {}
			local L_48_ = {}
			for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
				if L_51_forvar1 ~= L_31_ then
					table.insert(L_46_, L_51_forvar1)
				end
			end
			for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
				if L_53_forvar1.Character ~= nil then
					local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
					if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
						local L_55_ =
							(L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
						local L_56_ =
							Ray.new(
								game.Workspace.CurrentCamera.CFrame.p,
								(L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
							)
						local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
						local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
						L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
						L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
						L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
						L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
						table.insert(L_48_, L_59_)
					elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
						local L_60_ =
							(L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
						local L_61_ =
							Ray.new(
								game.Workspace.CurrentCamera.CFrame.p,
								(L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
							)
						local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
						local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
						L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
						L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
						L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
						L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
						table.insert(L_48_, L_64_)
					end
				end
			end
			if unpack(L_48_) == nil then
				return nil
			end
			local L_49_ = math.floor(math.min(unpack(L_48_)))
			if L_49_ > getgenv().AimRadius then
				return nil
			end
			for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
				if L_66_forvar1.diff == L_49_ then
					return L_66_forvar1.plr
				end
			end
			return nil
		end
		L_32_.KeyDown:Connect(
			function(L_67_arg0)
				if L_67_arg0 == AimlockKey and L_41_ == nil then
					pcall(
						function()
							if L_39_ ~= true then
								L_39_ = true
							end
							local L_68_
							L_68_ = GetNearestTarget()
							if L_68_ ~= nil then
								L_41_ = L_68_
							end
						end
					)
				elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
					if L_41_ ~= nil then
						L_41_ = nil
					end
					if L_39_ ~= false then
						L_39_ = false
					end
				end
			end
		)
		L_29_.RenderStepped:Connect(
			function()
				if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
					if
						(L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
						(L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
					then
						L_40_ = true
					else
						L_40_ = false
					end
				elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
					if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
						L_40_ = true
					else
						L_40_ = false
					end
				elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
					if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
						L_40_ = true
					else
						L_40_ = false
					end
				end
				if L_38_ == true and L_39_ == true then
					if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
						if getgenv().FirstPerson == true then
							if L_40_ == true then
								if getgenv().PredictMovement == true then
									L_33_.CFrame =
										L_34_(
											L_33_.CFrame.p,
											L_41_.Character[getgenv().AimPart].Position +
											L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
										)
								elseif getgenv().PredictMovement == false then
									L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
								end
							end
						elseif getgenv().ThirdPerson == true then
							if L_40_ == true then
								if getgenv().PredictMovement == true then
									L_33_.CFrame =
										L_34_(
											L_33_.CFrame.p,
											L_41_.Character[getgenv().AimPart].Position +
											L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
										)
								elseif getgenv().PredictMovement == false then
									L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
								end
							end
						end
					end
				end
			end
		)
	end
}
local L_18_ = loadstring(game:HttpGet("https://pastebin.com/raw/0XSRLQga"))()
Tab:Toggle{
	Name = "Esp",
	StartingState = false,
	Description = nil,
	Callback = function(L_201_arg0)
        L_18_:Toggle(L_201_arg0)
    end
}
Tab:Toggle{
	Name = "Tracers",
	StartingState = false,
	Description = nil,
	Callback = function(L_202_arg0)
        L_18_.Tracers = L_202_arg0
    end
}
Tab:Toggle{
	Name = "Names",
	StartingState = false,
	Description = nil,
	Callback = function(L_203_arg0)
        L_18_.Names = L_203_arg0
    end
}

Tab:Toggle{
	Name = "Boxes",
	StartingState = false,
	Description = nil,
	Callback = function(L_204_arg0)
        L_18_.Boxes = L_204_arg0
    end
}

local Tab = GUI:Tab{
	Name = "Player",
	Icon = "rbxassetid://8797391485"
}
Tab:Button{
    Name = "Speed [C]",
    Description = nil,
    Callback = function ()
        loadstring(game:HttpGet("https://pastebin.com/raw/C5p66edV"))()
    end
}
Tab:Button{
    Name = "Korblox",
    Description = nil,
    Callback = function ()
        local ply = game.Players.LocalPlayer
        local chr = ply.Character
        chr.RightLowerLeg.MeshId = "902942093"
        chr.RightLowerLeg.Transparency = "1"
        chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
        chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
        chr.RightFoot.MeshId = "902942089"
        chr.RightFoot.Transparency = "1"
    end
}
Tab:Button{
    Name = "Headless",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.Head.Transparency = 1

        for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do 
     
            if (v:IsA("Decal")) then
                v:Destroy()
            end
        end 
    end
}
Tab:Button{
    Name = "Face changer",
    Description = nil,
    Callback = function ()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/Scripts/main/carlface'))()
    end
}
Tab:Toggle{
	Name = "God/touchkillaura",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
            getgenv().c = true;
            while getgenv().c == true do
               
                  wait()
                  local A_1 = "SuperPunch"
                  local Event = game:GetService("ReplicatedStorage").SuperPunch
                  Event:FireServer(A_1)
            end
         else
            getgenv().c = false;
         end
    end
}
Tab:Toggle{
	Name = "God/touchkillaura with adminpunch",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
            getgenv().c2 = true;
            while getgenv().c2 == true do
            local A_1 = "SuperPunch"
            local Event = game:GetService("ReplicatedStorage").AdminSuperPunch
            Event:FireServer(A_1)
            wait()
            end
        else
            getgenv().c2 = false;
        end
    end
}
Tab:Toggle{
	Name = "Grab all cash",
	StartingState = false,
	Description = nil,
	Callback = function(state)
        if state then
		
			local b = true;
			while b == true do
			local c = game:GetService("Workspace").MAP.MoneyDrops.MoneyDrop
			local d = game:GetService("Workspace").MAP.MoneyDrops.MoneyDrop.ClickDetector
			function teleportTO(placeCFrame)
    		local plyr = game.Players.LocalPlayer;
    		if plyr.Character then
        		plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
    		end
			end
			
			teleportTO(c.CFrame)
			wait()
			fireclickdetector(d)
			wait()
		end
	else
		b = false;
	end
    end
}
local Animate = game.Players.LocalPlayer.Character.Animate
local Tab = GUI:Tab{
	Name = "animations",
	Icon = "rbxassetid://168702554"
}
Tab:Button{
    Name = "Zombie",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true	
    end
}
Tab:Button{
    Name = "Werwolf",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true	
    end
}
Tab:Button{
    Name = "Vampire",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Toy",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Superhero",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Stylish",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true	
    end
}
Tab:Button{
    Name = "Robot",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true	
    end
}
Tab:Button{
    Name = "Pirate",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Ninja",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Mage",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true	
    end
}
Tab:Button{
    Name = "Levitation",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Knight",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Elder",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Cartoony",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Bubbly",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
        Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
        Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Astronaut",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
Tab:Button{
    Name = "Pro",
    Description = nil,
    Callback = function ()
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
}
local Tab = GUI:Tab{
	Name = "Serverstuff",
	Icon = "rbxassetid://2782218657"
}
Tab:Button{
    Name = "rejoin",
    Description = nil,
    Callback = function ()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        local Rejoin = coroutine.create(function()
            local Success, ErrorMessage = pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        
            if ErrorMessage and not Success then
                warn(ErrorMessage)
            end
        end)
        
        coroutine.resume(Rejoin)
    end
}
Tab:Button{
    Name = "servercrasher [click this like 25 times]",
    Description = nil,
    Callback = function ()
        local b = true
        while b == true do
           local args = {
              [1] = "100",
              [2] = "DropMoney",
          }
          
          game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
          wait()
          if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
             game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet").Parent = game.Players.LocalPlayer.Character
             game.Players.LocalPlayer.Backpack:FindFirstChild('[Money Gun]').Parent = game.Players.LocalPlayer.Character
         end
         game.Players.LocalPlayer.Character:FindFirstChild('[Money Gun]'):Activate()
		game.Players.LocalPlayer.Character:FindFirstChild('[Money Gun]'):Deactivate()
          game.Workspace.MAP.MoneyDrops.ChildAdded:Connect(function(lol)
             wait(0.5)
             lol:Destroy()
         end)
        end
    end
}
if game.PlaceId == 8480101488 then
local Tab = GUI:Tab{
    Name = "Buys",
    Icon = "rbxassetid://3192485759"
}
    wait()
    for _, v in pairs(Workspace.MAP.Shop:GetChildren()) do
        Tab:Button{ Name = v.Name, Description = nil,Callback = function ()
            local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local k = game.Workspace.MAP.Shop[v.Name]
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
                wait(.2)
                fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
            end
        end}
    end
    wait()
end
local Tab = GUI:Tab{
	Name = "Admin",
	Icon = "rbxassetid://4840627152"
}
Tab:Button{
    Name = "Admin glider [FE]",
    Description = nil,
    Callback = function ()
        game:GetService("ReplicatedStorage").GliderEvent:FireServer()
    end
}

local Tab = GUI:Tab{
	Name = "Teleports",
	Icon = "rbxassetid://1031181007"
}
Tab:Button{
    Name = "bank",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5.409069538116455, 574.6506958007812, -22.34546661376953)

    end
}
Tab:Button{
    Name = "gym",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(106.88611602783203, 575.9006958007812, -37.12929153442383)

    end
}
Tab:Button{
    Name = "rev and db",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-261.4815979003906, 574.650634765625, -10.152166366577148)

    end
}
Tab:Button{
    Name = "downhill gunshop",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-151.4136505126953, 575.5137329101562, -151.08712768554688)

    end
}
Tab:Button{
    Name = "uphill gunshop",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(905.24560546875, 600.9568481445312, 37.30143356323242)
    end
}
Tab:Button{
    Name = "hood kicks",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.88497924804688, 574.7464599609375, -163.5422821044922)

    end
}
Tab:Button{
    Name = "cinema",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(385.88702392578125, 578.1563110351562, -239.9841766357422)

    end
}
Tab:Button{
    Name = "gas station",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1049.4893798828125, 603.9009399414062, 122.4984130859375)

    end
}
Tab:Button{
    Name = "police station",
    Description = nil,
    Callback = function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(483.1659851074219, 574.6555786132812, -229.8844451904297)

    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxassetid://8099777545"
}

Tab:Button{
    Name = "Reduce lag",
    Description = nil,
    Callback = function ()
        local decalsyeeted = true
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        g.Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            end
        end
        
        for i, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end
}
Tab:Slider{
	Name = "Fov",
	Default = 70,
	Min = 0,
	Max = 120,
	Callback = function(value) 
        local amount = value 

        game:GetService'Workspace'.Camera.FieldOfView = amount
    end
}




GUI:Credit{
	Name = "SoloDev",
	Description = "Owner",
	V3rm = "sorry I don't got a v3rm",
	Discord = "SoloDev#7416"
}






-- antiafk

while true do
	local VirtualUser = game:GetService('VirtualUser')
	game:GetService('Players').LocalPlayer.Idled:connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		end)
	wait()
	end
