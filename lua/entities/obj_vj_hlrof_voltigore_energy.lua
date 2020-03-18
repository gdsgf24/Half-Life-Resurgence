/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Voltigore Electrical Energy"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "Projectiles"

if (CLIENT) then
	local Name = "Voltigore Electrical Energy"
	local LangName = "obj_vj_hlrof_voltigore_energy"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !(SERVER) then return end

ENT.Model = {"models/spitball_large.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 25 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_SHOCK -- Damage type
ENT.SoundTbl_OnCollide = {"vj_hlr/hl1_weapon/gauss/electro4.wav","vj_hlr/hl1_weapon/gauss/electro5.wav","vj_hlr/hl1_weapon/gauss/electro6.wav"}
ENT.DecalTbl_DeathDecals = {"VJ_HLR_Scorch"} -- Decals that paint when the projectile dies | It picks a random one from this table
ENT.DelayedRemove = 1 -- Change this to a number greater than 0 to delay the removal of the entity

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetNoDraw(true)
	
	self.Glow1 = ents.Create("env_sprite")
	self.Glow1:SetKeyValue("model","vj_hl/sprites/flare3.vmt")
	self.Glow1:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	self.Glow1:SetKeyValue("renderfx","14")
	self.Glow1:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	self.Glow1:SetKeyValue("renderamt","255") -- Transparency
	self.Glow1:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	self.Glow1:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	self.Glow1:SetKeyValue("spawnflags","0")
	self.Glow1:SetPos(self:GetPos())
	self.Glow1:SetParent(self)
	self.Glow1:Spawn()
	self.Glow1:Activate()
	self:DeleteOnRemove(self.Glow1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Vort_DoElecEffect(sp,hp,a,t)
	local elec = EffectData()
	elec:SetStart(sp)
	elec:SetOrigin(hp)
	elec:SetEntity(self)
	elec:SetAttachment(a)
	elec:SetScale(t)
	util.Effect("VJ_HLR_Electric_Purple",elec)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- Tsakh --------------------------
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*20,
				endpos = self:GetPos() + self:GetRight()*math.Rand(150,200) + self:GetUp()*-200,
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 1, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*20,
				endpos = self:GetPos() + self:GetRight()*math.Rand(150,200) + self:GetUp()*-200 + self:GetForward()*-math.Rand(150,200),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 1, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*20,
				endpos = self:GetPos() + self:GetRight()*math.Rand(150,200) + self:GetUp()*-200 + self:GetForward()*math.Rand(150,200),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 1, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*20,
				endpos = self:GetPos() + self:GetRight()*math.Rand(1,150) + self:GetUp()*200 + self:GetForward()*math.Rand(-100,100),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 1, randt)
		end
	end)
	
	-- Ach --------------------------
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*-20,
				endpos = self:GetPos() + self:GetRight()*-math.Rand(150,200) + self:GetUp()*-200,
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 2, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*-20,
				endpos = self:GetPos() + self:GetRight()*-math.Rand(150,200) + self:GetUp()*-200 + self:GetForward()*-math.Rand(150,200),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 2, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*-20,
				endpos = self:GetPos() + self:GetRight()*-math.Rand(150,200) + self:GetUp()*-200 + self:GetForward()*math.Rand(150,200),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 2, randt)
		end
	end)
	
	local randt = math.Rand(0,0.6)
	timer.Simple(randt,function()
		if IsValid(self) then
			local tr = util.TraceLine({
				start = self:GetPos() + self:GetUp()*45 + self:GetRight()*-20,
				endpos = self:GetPos() + self:GetRight()*-math.Rand(1,150) + self:GetUp()*200 + self:GetForward()*math.Rand(-100,100),
				filter = self
			})
			self:Vort_DoElecEffect(tr.StartPos, tr.HitPos, 2, randt)
		end
	end)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/