local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Egg")
local T3 = wndw:Tab("Match")
local T4 = wndw:Tab("Stats Upgrader")

local workspace = game:GetService("Workspace")
local self = game:GetService("Players").LocalPlayer
local bool = {
  a1 = false,
  a2 = false,
  a3 = false,
  a4 = false,
  a5 = false,
  egg = {},
  segg = "",
  a6 = false,
  a7 = false,
  a8 = false,
  stable = {"Defense","Damage","Speed","Luck"},
  stats = "Defense",
  point = 1,
  a9 = false
}

lib:AddTable(workspace.Egg,bool.egg)

T1:Toggle("Auto damage",false,function(value)
    bool.a1 = value
    while wait() do
      if bool.a1 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Weapon"]["TakeDamage"]:FireServer()
    end
end)

T1:Toggle("Auto claim online reward",false,function(value)
    bool.a2 = value
    while wait() do
      if bool.a2 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(1)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(2)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(3)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(4)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(5)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(6)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(7)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(8)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(9)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(10)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(11)
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Online"]["TryGetOnlineGift"]:InvokeServer(12)
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
    bool.a3 = value
    while wait() do
      if bool.a3 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Profile"]["RebirthRequest"]:InvokeServer()
    end
end)

T1:Toggle("Auto equip best weapon",false,function(value)
    bool.a4 = value
    while wait() do
      if bool.a4 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Weapon"]["EquipBest"]:FireServer()
    end
end)

T1:Toggle("Auto upgrade weapon",false,function(value)
    bool.a5 = value
    while wait() do
      if bool.a5 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Weapon"]["Upgrade"]:FireServer()
    end
end)

T2:Dropdown("Choose eggs",bool.egg,function(value)
    bool.segg = tonumber(value)
end)

T2:Toggle("Auto hatch",false,function(value)
    bool.a6 = value
    while wait() do
      if bool.a6 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Hatch"]["EggHatch"]:InvokeServer(bool.segg,"1",{})
    end
end)

T2:Toggle("Auto equip best pet",false,function(value)
    bool.a8 = value
    while wait() do
      if bool.a8 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Constant"]["Pet"]["EquipBest"]:FireServer()
    end
end)

T3:Toggle("Auto start match",false,function(value)
    bool.a7 = value
    if value == false then
      game:GetService("ReplicatedStorage")["Remotes"]["Match"]["Exit"]:InvokeServer()
    end
    
    while wait() do
      if bool.a7 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Match"]["Join"]:InvokeServer(self.stats.World.Value)
    end
end)

T4:Dropdown("Choose stats",bool.stable,function(value)
    bool.stats = value
end)

T4:Slider("Point used",0,50,1,function(value)
    bool.point = value
end)

T4:Toggle("Auto upgrade",false,function(value)
    bool.a9 = value
    while wait() do
      if bool.a9 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Profile"]["AddPoint"]:FireServer(bool.stats,bool.point)
    end
end)
