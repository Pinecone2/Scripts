--[[

#GOD: made by iFractal
getrenv()["lerp"]

]]--
local plr = game.Players.LocalPlayer
local chr = plr.Character
local maus = plr:GetMouse()
local PGui=plr.PlayerGui
local lleg = chr["Left Leg"]
local rleg = chr["Right Leg"]
local larm = chr["Left Arm"]
local rarm = chr["Right Arm"]
local hed = chr.Head
local rutprt = chr.HumanoidRootPart
local torso = chr.Torso
local otheranims=false
local swimming=false





---//*DEBOUNCES
canChangeFromC = true
canChangeFromA = true
canChangeFromCF = true
canChangeFromSF = true
canChangeFromPT = true
canChangeFromGT = true
canChangeFromUT = true
----
canChangeFromMT = true
----*\\









---//*AUDIO FOR MODES
---
dorado = Instance.new("Sound",chr)       ---casualFighting
dorado.SoundId = "rbxassetid://188095869"
dorado.Volume = 2
dorado.Looped = true
---
marxA = Instance.new("Sound",chr)       ---Annoyed
marxA.SoundId = "rbxassetid://464032364"
marxA.Pitch = 0.5
marxA.Volume = 2
marxA.Looped = true
---
----*\\






--//*Instances
AAura = Instance.new("ParticleEmitter")
CFAura1 = Instance.new("ParticleEmitter")
CFAura2 = Instance.new("ParticleEmitter")
RuneP = Instance.new("Part",chr.Torso)
RuneP.Parent = nil
annoyedPOWERUP = Instance.new("Sound")
casualFightingPOWERUP = Instance.new("Sound")
ShieldP = Instance.new("Part")
ShieldP.Parent = nil
local ShieldM = Instance.new("SpecialMesh")
ShieldHolder = Instance.new("Model",chr)
RShieldP = Instance.new("Part")
RShieldP.Parent = nil
---*\\





--//*MODES (in order of magnitude)
local calm = true --default
local annoyed = false
local casualFighting = false
local seriousFighting = false
local planetaryThreat = false
local galacticThreat = false
local universalThreat = false
----
local multiversalThreat = false
-----*\\
chr.Animate.Disabled=true
local fldb={['w']=false,['a']=false,['s']=false,['d']=false}
local RunSpeed=30

local WlkSpeed=16
local SwimSpeed=14
local SwimDashSpeed=28
local anim = "Idling"
local lastanim = "Idling"
local val = 0
local syne = 0
local num = 0
local runtime = 0
local pseudohead=hed:Clone()
for i,x in pairs(pseudohead:GetChildren()) do if not x.ClassName:find('Mesh') then x:Destroy() end end
pseudohead.Name='PseudoHead'
pseudohead.Parent=chr.Head
local pseudoweld=Instance.new('Weld',torso)
pseudoweld.Part0=hed
pseudoweld.Name='PseudoHedWld'
pseudoweld.Part1=pseudohead
hed.Transparency=1
coroutine.wrap(function()
for i,x in pairs(hed:GetChildren()) do if x:IsA('Sound') then x:Destroy() end end end)()
function Lerp(a, b, i)
local com1 = {a.X, a.Y, a.Z, a:toEulerAnglesXYZ()}
local com2 = {b.X, b.Y, b.Z, b:toEulerAnglesXYZ()}
local calx = com1[1] + (com2[1] - com1[1]) * i
local caly = com1[2] + (com2[2] - com1[2]) * i
local calz = com1[3] + (com2[3] - com1[3]) * i
local cala = com1[4] + (com2[4] - com1[4]) * i
local calb = com1[5] + (com2[5] - com1[5]) * i
local calc = com1[6] + (com2[6] - com1[6]) * i
return CFrame.new(calx, caly, calz) * CFrame.Angles(cala, calb, calc)
end
function TwnSingleNumber(s,f,m)
local wot=s+(f-s)*m
return wot
end
function TwnVector3(q,w,e)
local begin={q.x,q.y,q.z}
local ending={w.x,w.y,w.z}
local bgx=begin[1]+(ending[1]-begin[1])*e
local bgy=begin[2]+(ending[2]-begin[2])*e
local bgz=begin[3]+(ending[3]-begin[3])*e
return Vector3.new(bgx,bgy,bgz)
end
newWeld = function(wld, wp0, wp1, wc0x, wc0y, wc0z)
wld = Instance.new("Weld", wp1)
wld.Part0 = wp0
wld.Part1 = wp1
wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end
local angles = CFrame.Angles
function clerp(a, b, t)
    return a:lerp(b, t)
end
newWeld(law, torso, larm, -1.5, 0.5, 0)
newWeld(raw, torso, rarm, 1.5, 0.5, 0)
newWeld(llw, torso, lleg, -.5, -2, 0)
newWeld(rlw, torso, rleg, .5, -2, 0)
newWeld(hw, torso, hed, 0, 1.5, 0)
local rutwald=Instance.new('Weld',rutprt)
rutwald.Part0=rutprt
rutwald.Part1=torso
rutprt.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)
lleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)



--Rage modes (maybe)
casualR=false
annoyedR=false
casualFightingR=false
seriousFightingR=false
planetaryThreatR=false
galacticThreatR=false
universalThreatR=false
miltiversalThreatR=false
-----




maus.KeyDown:connect(function(kei)
if kei == "1" then
if canChangeFromC == true then
canChangeFromC = false
calm = true  -- active mode
annoyed = false
casualFighting = false
seriousFighting = false
planetaryThreat = false
galacticThreat = false
universalThreat = false
multiversalThreat = false
dorado:Stop()
marxA:Stop()
---------EFFECTS
CFAura1.Parent = nil
CFAura2.Parent = nil
AAura.Parent = nil
---------
---------DEBOUNCE ENABLE
wait(1)
canChangeFromCF = true
canChangeFromA = true
canChangeFromSF = true
canChangeFromPT = true
canChangeFromGT = true
canChangeFromUT = true
----
canChangeFromMT = true
---------
end
end
end)
maus.KeyDown:connect(function(kei)
if kei == "2" then
if canChangeFromA == true then
canChangeFromA = false
calm = false
annoyed = true  --active mode
casualFighting = false
seriousFighting = false
planetaryThreat = false
galacticThreat = false
universalThreat = false
multiversalThreat = false
dorado:Stop()
marxA:Play()

---------EFFECTS
CFAura1.Parent = nil
CFAura2.Parent = nil
AAura.Parent = chr.Torso
annoyedPOWERUP.Parent = chr.Torso
annoyedPOWERUP.Volume = 3
annoyedPOWERUP.SoundId = "http://www.roblox.com/asset/?id = 447041606"
annoyedPOWERUP:Play()

AAura.Texture = "rbxassetid://347730682"
local color1 = Color3.new(127,0,0)
local color2 = Color3.new(127,0,0)
AAura.Color = ColorSequence.new(color1,color2)
AAura.Size = NumberSequence.new(6,6,6,6,6,6)
AAura.Lifetime = NumberRange.new(0.3,0.3,0.3,0.3,0.3)
AAura.Rate = 20
AAura.Transparency = NumberSequence.new(0.6,0.6,0.6,0.6,0.6,0.6)
AAura.Speed = NumberRange.new(10,10,10,10,10,10)
AAura.LockedToPart = true
AExplodeP = Instance.new("Part",chr)
AExplodeP.Anchored = true
AExplodeP.TopSurface = 0
AExplodeP.Material = "Neon"
AExplodeP.BottomSurface = 0
AExplodeP.CanCollide = false
AExplodeP.CFrame = chr.Torso.CFrame
AExplodeP.BrickColor = BrickColor.new("Really red")
AExplodeP.Size = Vector3.new(1,1,1)
AExplodeM = Instance.new("SpecialMesh",AExplodeP)
AExplodeM.MeshType = "Sphere"


AExplodeP2 = Instance.new("Part",chr)
AExplodeP2.Anchored = true
AExplodeP2.TopSurface = 0
AExplodeP2.Material = "Neon"
AExplodeP2.BottomSurface = 0
AExplodeP2.CanCollide = false
AExplodeP2.CFrame = chr.Torso.CFrame
AExplodeP2.BrickColor = BrickColor.new("Really red")
AExplodeP2.Size = Vector3.new(1,1,1)
AExplodeM2 = Instance.new("FileMesh",AExplodeP2)
AExplodeM2.MeshId = "rbxassetid://20329976"
for i = 1,50,2 do wait()
AExplodeM.Scale = Vector3.new(i,i,i)
AExplodeP.Transparency = i/50
AExplodeM2.Scale = Vector3.new(i,i-30,i)
AExplodeP2.Transparency = i/50
end
AExplodeP:Remove()
AExplodeP2:Remove()
---------
---------DEBOUNCE ENABLE
wait(1)
canChangeFromCF = true
canChangeFromC = true
canChangeFromSF = true
canChangeFromPT = true
canChangeFromGT = true
canChangeFromUT = true
----
canChangeFromMT = true
---------
end
end
end)
maus.KeyDown:connect(function(kei)
if kei == "3" then
if canChangeFromCF == true then
canChangeFromCF = false
calm = false
annoyed = false
casualFighting = true -- active mode
seriousFighting = false
planetaryThreat = false
galacticThreat = false
universalThreat = false
multiversalThreat = false
dorado:Play()
marxA:Stop()
---------EFFECTS
AAura.Parent = nil

casualFightingPOWERUP.Parent = chr.Torso
casualFightingPOWERUP.Volume = 3
casualFightingPOWERUP.SoundId = "http://www.roblox.com/asset/?id = 447041606"
casualFightingPOWERUP:Play()
CFAura1.Parent = chr.Torso
CFAura1.Texture = "rbxassetid://347730682"
local color1 = Color3.new(127,0,127)
local color2 = Color3.new(127,0,127)
local sequence = ColorSequence.new(color1,color2)
CFAura1.Color = ColorSequence.new(color1,color2)
CFAura1.Size = NumberSequence.new(6,6,6,6,6,6)
CFAura1.Lifetime = NumberRange.new(0.3,0.3,0.3,0.3,0.3)
CFAura1.Rate = 20
CFAura1.Transparency = NumberSequence.new(0.6,0.6,0.6,0.6,0.6,0.6)
CFAura1.Speed = NumberRange.new(10,10,10,10,10,10)
CFAura1.LockedToPart = true

CFAura2.Parent = chr.Torso

CFAura2.Texture = "rbxassetid://269782022"
local color1 = Color3.new(0,0,0)
local color2 = Color3.new(0,0,0)
local sequence = ColorSequence.new(color1,color2)
CFAura2.Color = ColorSequence.new(color1,color2)
CFAura2.Size = NumberSequence.new(6,6,6,6,6,6)
CFAura2.Lifetime = NumberRange.new(0.2,0.2,0.2,0.2,0.2)
CFAura2.Rate = 20
CFAura2.Transparency =NumberSequence.new(0.4,0.4,0.4,0.4,0.4,0.4)
CFAura2.Speed = NumberRange.new(10,10,10,10,10,10)
CFAura2.LockedToPart = true
CFExplodeP = Instance.new("Part",chr)
CFExplodeP.Anchored = true
CFExplodeP.CanCollide = false
CFExplodeP.CFrame = chr.Torso.CFrame
CFExplodeP.BrickColor = BrickColor.new("Magenta")
CFExplodeP.Size = Vector3.new(1,1,1)
CFExplodeM = Instance.new("SpecialMesh",CFExplodeP)
CFExplodeM.MeshType = "FileMesh"
CFExplodeM.MeshId = "http://www.roblox.com/Asset/?id=9982590"
for i = 1,50,2 do wait()
CFExplodeM.Scale = Vector3.new(i,i,i)
CFExplodeP.Transparency = i/50
end
CFExplodeP:Remove()
---------DEBOUNCE ENABLE
wait(1)
canChangeFromC = true
canChangeFromA = true
canChangeFromSF = true
canChangeFromPT = true
canChangeFromGT = true
canChangeFromUT = true
----
canChangeFromMT = true
---------
end
end
end)

---//*MOVES



--*\\

maus.KeyDown:connect(function(kei)
if string.byte(kei)==48 and not otheranims then
runnin=true
end
if kei=='w' then fldb.w=true end
if kei=='a' then fldb.a=true end
if kei=='s' then fldb.s=true end
if kei=='d' then fldb.d=true end
end)
maus.KeyUp:connect(function(kei)
if string.byte(kei)==48 and not otheranims then
runnin=false
end
if kei=='w' then fldb.w=false end
if kei=='a' then fldb.a=false end
if kei=='s' then fldb.s=false end
if kei=='d' then fldb.d=false end
end)





game:service'RunService'.RenderStepped:connect(function()
if anim~=lastanim then
runtime=0
end
lastanim=anim
chr.Humanoid.CameraOffset=(rutprt.CFrame:toObjectSpace(hed.CFrame)).p+Vector3.new(0,-1.25,0)
syne=syne+.95
if not otheranims and not swimming then
if (torso.Velocity*Vector3.new(1, 0, 1)).magnitude < 1 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Idling"
elseif (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude > 1 and (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude < RunSpeed-10 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Walking"
elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude > RunSpeed-10 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Sprinting"
elseif torso.Velocity.y>5 and chr.Humanoid.Jump then
anim='Jumping'
elseif (torso.Velocity.y < -5) and chr.Humanoid.Jump then
anim='Falling'
end
end


if anim=="Idling" then
idlesineinc=35
if casualFighting == true then


rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.4+math.cos(syne/idlesineinc)/25,-.3)*CFrame.Angles(math.rad(90),0,math.rad(-20)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1,.4+math.cos(syne/idlesineinc)/25,.5)*CFrame.Angles(math.rad(-10),math.rad(20-(math.cos(syne/idlesineinc)/35)),math.rad(-20)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-1,-1.7-math.cos(syne/idlesineinc)/20,0.2)*CFrame.Angles(math.rad(0),math.cos(syne/idlesineinc)/55+math.rad(25),math.rad(-20)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(1,-1.5-math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.rad(0),math.cos(syne/idlesineinc)/55+math.rad(-30),math.rad(0)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,math.rad(-70),0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-0.5+math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.cos(syne/idlesineinc)/55+math.rad(-5),math.rad(60),math.rad(0)),.1)
end
if calm == true then

rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(0,0,math.rad(3)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(0,0,math.rad(-3)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.cos(syne/idlesineinc)/35+math.rad(0),math.rad(0),math.rad(0)),.1)
end
if annoyed == true then

rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.2,.3+math.cos(syne/idlesineinc)/25,0.2)*CFrame.Angles(math.rad(-50),0,math.rad(-40)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.2,.3+math.cos(syne/idlesineinc)/25,0.2)*CFrame.Angles(math.rad(-50),0,math.rad(40)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.cos(syne/idlesineinc)/35+math.rad(0),math.rad(0),math.rad(0)),.1)
end
end
if anim=="Walking" then
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525+math.cos(syne/15)/25,0)*CFrame.Angles(math.cos(syne/6)/1.25,math.rad(5),-(math.cos(syne/6.75)/15)+math.rad(3)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525+math.cos(syne/15)/25,0)*CFrame.Angles(-(math.cos(syne/6)/1.25),0,-(math.cos(syne/6.75)/15)-math.rad(3)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/6)/10,-(math.cos(syne/6)/1.125))*CFrame.Angles(math.cos(syne/6)/1.125,0,math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/6)/10,math.cos(syne/6)/1.125)*CFrame.Angles(-(math.cos(syne/6)/1.125),0,math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/20)/50,0)*CFrame.Angles(-math.cos(syne/3)/20,0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/3.375)/20,math.cos(syne/3)/5)*CFrame.Angles(math.cos(syne/3)/20+math.rad(-3.5),math.cos(syne/6)/10,-math.cos(syne/6)/30+math.sin(rutprt.RotVelocity.y/2)/7.5),.1)
end

if anim=="Sprinting" then

if calm == true then
RunSpeed = 25
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-15),0,math.rad(12.5)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-15),0,math.rad(-12.5)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-2,0)*CFrame.Angles(math.rad(-10),math.rad(-7),math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-2,0)*CFrame.Angles(math.rad(-10),math.rad(7),math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.55,0)*CFrame.Angles(math.rad(15),0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,1,0)*CFrame.Angles(math.rad(-15),0,math.sin(rutprt.RotVelocity.y/2)/2),.1)
end
if annoyed == true then
RunSpeed = 50
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-25),0,math.rad(12.5)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-25),0,math.rad(-12.5)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-2,0)*CFrame.Angles(math.rad(-15),math.rad(-7),math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-2,0)*CFrame.Angles(math.rad(-15),math.rad(7),math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.55,0)*CFrame.Angles(math.rad(15),0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,1,0)*CFrame.Angles(math.rad(-25),0,math.sin(rutprt.RotVelocity.y/2)/2),.1)
end
if casualFighting == true then
RunSpeed = 75
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-55),0,math.rad(12.5)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-55),0,math.rad(-12.5)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.6-math.cos(syne/4)/4,-(math.cos(syne/4)*2)-math.rad(10))*CFrame.Angles(math.cos(syne/4)*2+math.rad(10),0,math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.6-math.cos(syne/4)/4,math.cos(syne/4)*2-math.rad(10))*CFrame.Angles(-(math.cos(syne/4)*2)+math.rad(10),0,math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.55+math.cos(syne/20)/50,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(20),0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.3+math.cos(syne/2.5)/15,math.cos(syne/2.5))*CFrame.Angles(math.rad(-25),math.cos(syne/2.5)/10,math.sin(rutprt.RotVelocity.y/2)/4),.1)
end
end
if anim=="Jumping" then
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(50)),.1)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-50)),.1)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-2.3,0)*CFrame.Angles(math.rad(-17.5),0,math.rad(-2.5)),.1)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-2,-.1)*CFrame.Angles(math.rad(-17.5),0,math.rad(2.5)),.1)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/20)/50,0)*CFrame.Angles(math.cos(syne/20)/40,0,0),.1)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(-15),math.rad(0),math.rad(0)),.1)
end

if anim=="Falling" then
rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(70)),.035)
larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-70)),.035)
lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.2,0)*CFrame.Angles(math.rad(-14),0,math.rad(-2.5)),.035)
rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9,0)*CFrame.Angles(math.rad(0),0,math.rad(2.5)),.035)
hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5,-.3)*CFrame.Angles(math.rad(-40),0,0),.035)
rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.035)
end

if runnin and not otheranims and not swimming then
chr.Humanoid.WalkSpeed=RunSpeed
elseif not runnin and not otheranims and not swimming then
chr.Humanoid.WalkSpeed=WlkSpeed
end
end)

