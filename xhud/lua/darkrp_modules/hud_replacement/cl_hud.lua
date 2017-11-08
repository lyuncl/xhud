					--[[-----------------------------------
								MADE BY YUN.C
					-----------------------------------]]
	--	LANGUAGE	--
local lockdownt = "Sokaga cikma yasagi ilan edildi!"	-- ENGLISH EXAMPLE: "There is a lockdown!"
local mag = "sarjor"		-- ENGLISH EXAMPLE: MAGAZINE
local ammo = "Mermi"		-- ENGLISH EXAMPLE: AMMO





























if CLIENT then 
surface.CreateFont( "HUDText", {
	font = "BebasNeue",
	size = 20,
	weight = 500,
} )
surface.CreateFont( "HUDText1", {
	font = "BebasNeue",
	size = 55,
	weight = 500,
} )
surface.CreateFont( "HUDText2", {
	font = "BebasNeue",
	size = 35,
	weight = 500,
} )
end


local x,y = 15, ScrH() - 20

	--	HUD	--
local function xHUD()
--BACKGROUND
	draw.RoundedBox(0, x - 10, y - 130, 85, 80, Color(40,40,40,250))
	draw.RoundedBox(0, x - 10, y - 165, 200, 30, Color(40,40,40,250))
	draw.RoundedBox(0, x + 80, y - 130, 110, 80, Color(40,40,40,250))
	draw.RoundedBox(0, x - 10, y - 45, 200, 15, Color(40,40,40,250))
	draw.RoundedBox(0, x - 10, y - 25, 200, 15, Color(40,40,40,250))
	draw.RoundedBox(0, x - 10, y - 5, 200, 15, Color(40,40,40,250))
--HEALTH
	local healthtext = LocalPlayer():Health() or 0

	local healthbar = LocalPlayer():Health() or 0

	if healthbar > 100 then healthbar = 100 end

	if healthbar < 0 then healthbar = 0 end


	if healthbar != 0 then

		draw.RoundedBox( 0, 11, y - 43, (270) * healthbar / 142, 11, Color(245, 65, 60, 250) )

	end
	draw.DrawText( ""..healthtext, "HUDText", x + 90, ScrH () - 67, Color(255,255,255,255),TEXT_ALIGN_CENTER)
--ARMOR
	local armortext = LocalPlayer():Armor() or 0

	local armorbar = LocalPlayer():Armor() or 0



	if armorbar > 100 then armorbar = 100 end

	if armorbar < 0 then armorbar = 0 end



	if armorbar != 0 then

		draw.RoundedBox( 0, 11, y - 23, (270) * armorbar / 142, 11, Color(60, 105, 240, 250) )

	end
	draw.DrawText( ""..armortext, "HUDText", x + 90, ScrH () - 47, Color(255,255,255,255),TEXT_ALIGN_CENTER)
--HUNGER
	local hungertext = LocalPlayer():getDarkRPVar("Energy") or 0

	local hungerbar = LocalPlayer():getDarkRPVar("Energy") or 0



	if hungerbar > 100 then hungerbar = 100 end

	if hungerbar < 0 then hungerbar = 0 end



	if hungerbar != 0 then

		draw.RoundedBox( 0, 11, y - 3, (270) * hungerbar / 142, 11, Color(150, 155, 50, 250) )

	end
	draw.DrawText( ""..hungertext, "HUDText", x + 90, ScrH () - 27, Color(255,255,255,255),TEXT_ALIGN_CENTER)
--JOB
	local job = LocalPlayer():getDarkRPVar("job") or 0
	draw.DrawText(job, "HUDText", x + 85, ScrH () - 140, Color(255,255,255,255),TEXT_ALIGN_LEFT)
--SALARY
	local salary = LocalPlayer():getDarkRPVar("salary") or 0
	draw.DrawText( "₺"..salary, "HUDText", x + 85, ScrH () - 118, Color(255,255,255,255),TEXT_ALIGN_LEFT)
--MONEY
	local money = LocalPlayer():getDarkRPVar("money") or 0
	draw.DrawText( "₺"..money, "HUDText", x + 85, ScrH () - 95, Color(255,255,255,255),TEXT_ALIGN_LEFT)
--INFO
local name = LocalPlayer():Name()
	draw.DrawText( ""..name, "HUDText", x + 90, ScrH () - 179, Color(255,255,255,255),TEXT_ALIGN_CENTER)

end

local function DrawAmmo()
	local ply = LocalPlayer()
	if !IsValid(ply:GetActiveWeapon()) then return end
	if (ply:GetActiveWeapon():Clip1() == NULL or ply:GetActiveWeapon() == "Camera") then return end
	local mag_left = LocalPlayer():GetActiveWeapon():Clip1()
	local mag_extra = LocalPlayer():GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
	
	if (ply:GetActiveWeapon():GetClass() == "weapon_physcannon") then
		return false
	elseif mag_left == -1 then
		return false
	elseif mag_extra >= 0 then

		draw.RoundedBox(0,ScrW()-195,ScrH()-65,90,60,Color(40,40,40,250))
end
		draw.DrawText(mag_left,"HUDText1",ScrW()-150,ScrH()-60,Color(255,255,255,250),TEXT_ALIGN_CENTER)
		draw.RoundedBox(0,ScrW()-95,ScrH()-65,90,60,Color(40,40,40,250))

		draw.DrawText(mag_extra,"HUDText1",ScrW()-50,ScrH()-60,Color(255,255,255,250),TEXT_ALIGN_CENTER)

		draw.RoundedBox(0,ScrW()-192.5,ScrH()-110,85,40,Color(40,40,40,250))
		draw.RoundedBox(0,ScrW()-95,ScrH()-110,85,40,Color(40,40,40,250))
		draw.DrawText(mag,"HUDText2",ScrW()-52,ScrH()-106,Color(255,255,255,250),TEXT_ALIGN_CENTER)
		draw.DrawText(ammo,"HUDText2",ScrW()-150,ScrH()-106,Color(255,255,255,250),TEXT_ALIGN_CENTER)
	end

	--	HIDE	--
local hidden = { "DarkRP_LocalPlayerHUD", "DarkRP_Hungermod", "CHudHealth", "CHudBattery", "CHudAmmo", "CHudPrimaryAmmo"}


hook.Add("HUDShouldDraw", "MHUD_Hide", function(name)

	if table.HasValue(hidden, name) || (name == "DarkRP_EntityDisplay") then return false end

end)

	--	AVATAR	--
local avatar
function HUDValidCheck()

    if IsValid( LocalPlayer() ) && !IsValid( avatar ) then
    
        avatar = vgui.Create( "AvatarImage" )
		avatar:ParentToHUD()
        avatar:SetSize( 74, 74 )
        avatar:SetPos( 11, ScrH() - 147 )
        avatar:SetPlayer( LocalPlayer(), 128 )
    
    end

end
hook.Add( "HUDPaint", "AvatarImage", HUDValidCheck )



--[[---------------------------------------------------------------------------
HUD ConVars
---------------------------------------------------------------------------]]
local ConVars = {}
local HUDWidth
local HUDHeight

local localplayer = LocalPlayer()
local Color = Color
local CurTime = CurTime
local cvars = cvars
local DarkRP = DarkRP
local draw = draw
local GetConVar = GetConVar
local hook = hook
local IsValid = IsValid
local Lerp = Lerp
local localplayer
local math = math
local pairs = pairs
local ScrW, ScrH = ScrW, ScrH
local SortedPairs = SortedPairs
local string = string
local surface = surface
local table = table
local timer = timer
local tostring = tostring
local plyMeta = FindMetaTable("Player")

local colors = {}
colors.black = Color(0, 0, 0, 255)
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51,100)
colors.red = Color(255, 0, 0, 255)
colors.white = Color(255, 255, 255, 255)
colors.white1 = Color(255, 255, 255, 200)

local function ReloadConVars()
    ConVars = {
        background = {0,0,0,100},
        Healthbackground = {0,0,0,200},
        Healthforeground = {140,0,0,180},
        HealthText = {255,255,255,200},
        Job1 = {0,0,150,200},
        Job2 = {0,0,0,255},
        salary1 = {0,150,0,200},
        salary2 = {0,0,0,255}
    }

    for name, Colour in pairs(ConVars) do
        ConVars[name] = {}
        for num, rgb in SortedPairs(Colour) do
            local CVar = GetConVar(name .. num) or CreateClientConVar(name .. num, rgb, true, false)
            table.insert(ConVars[name], CVar:GetInt())

            if not cvars.GetConVarCallbacks(name .. num, false) then
                cvars.AddChangeCallback(name .. num, function()
                    timer.Simple(0, ReloadConVars)
                end)
            end
        end
        ConVars[name] = Color(unpack(ConVars[name]))
    end


    HUDWidth = (GetConVar("HudW") or  CreateClientConVar("HudW", 240, true, false)):GetInt()
    HUDHeight = (GetConVar("HudH") or CreateClientConVar("HudH", 115, true, false)):GetInt()

    if not cvars.GetConVarCallbacks("HudW", false) and not cvars.GetConVarCallbacks("HudH", false) then
        cvars.AddChangeCallback("HudW", function() timer.Simple(0,ReloadConVars) end)
        cvars.AddChangeCallback("HudH", function() timer.Simple(0,ReloadConVars) end)
    end
end
ReloadConVars()

local Scrw, Scrh, RelativeX, RelativeY


local Page = Material("icon16/page_white_text.png")
local function GunLicense()
localplayer = LocalPlayer()
    if localplayer:getDarkRPVar("HasGunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(RelativeX + HUDWidth, Scrh - 34, 32, 32)
 
	end
end

local function Agenda()
	local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_Agenda")
	if shouldDraw == false then return end
	local ply = LocalPlayer()

	local agenda = ply:getAgendaTable()
	if not agenda then return end
	draw.RoundedBox(0, 10, 10, 460, 110, Color(54,54,54,215))
	draw.RoundedBox(0, 12, 12, 456, 20, Color(38,38,38,215))
	
	surface.SetDrawColor(0,0,0,215)
	surface.DrawLine(10,30,470,30)
	surface.SetDrawColor(61,61,61,215)
	surface.DrawLine(10,30,470,30)
		
	draw.DrawText(agenda.Title, "HUDText", 20, 12, color_white)
	
	draw.RoundedBox(10, 10, 10, 460, 110, Color(0, 0, 0, 155))
	draw.RoundedBox(10, 12, 12, 456, 106, Color(51, 58, 51,100))
	draw.RoundedBox(10, 12, 12, 456, 20, Color(0, 0, 70, 100))

	local text = ply:getDarkRPVar("agenda") or ""

	text = text:gsub("//", "\n"):gsub("\\n", "\n")
	text = DarkRP.textWrap(text, "HUDText", 440)
	draw.DrawText(text, "HUDText", 20, 12, color_white)
end

local function Agenda()
	local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_Agenda")
	if shouldDraw == false then return end
	local DrawAgenda, AgendaManager = DarkRPAgendas[localplayer:Team()], localplayer:Team()
	if not DrawAgenda then
		for k,v in pairs(DarkRPAgendas) do
			if table.HasValue(v.Listeners or {}, localplayer:Team()) then
				DrawAgenda, AgendaManager = DarkRPAgendas[k], k
				break
			end
		end
	end
	if DrawAgenda then
		draw.RoundedBox(0, 10, 10, 360, 150, Color(70,70,70,250))
		draw.RoundedBox(0, 12, 12, 356, 20, Color(40,40,40,250))
		draw.DrawText(DrawAgenda.Title, "HUDText", 150, 12, color_white)
		
		local AgendaText = {}
		for k,v in pairs(team.GetPlayers(AgendaManager)) do
			if not v.DarkRPVars then continue end
			table.insert(AgendaText, v:getDarkRPVar("agenda"))
		end

		local text = table.concat(AgendaText, "\n")
		text = text:gsub("//", "\n"):gsub("\\n", "\n")
		text = DarkRP.textWrap(text, "HUDText", 440)
		draw.DrawText(text, "HUDText", 30, 35, Color(255,255,255,255),0)
	end
end

local VoiceChatTexture = surface.GetTextureID("voice/icntlk_pl")
local function DrawVoiceChat()
    if localplayer.DRPIsTalking then
        local _, chboxY = chat.GetChatBoxPos()

        local Rotating = math.sin(CurTime() * 3)
        local backwards = 0

        if Rotating < 0 then
            Rotating = 1 - (1 + Rotating)
            backwards = 180
        end

        surface.SetTexture(VoiceChatTexture)
        surface.SetDrawColor(ConVars.Healthforeground)
        surface.DrawTexturedRectRotated(Scrw - 100, chboxY, Rotating * 96, 96, backwards)
    end
end

local function LockDown()
	if GetGlobalBool("DarkRP_LockDown") then
	draw.RoundedBox(0,x - 9, y - 200,200,30,Color(40,40,40,250))
	draw.DrawText( lockdownt, "HUDText", x + 90, ScrH () - 213.5, Color(155,155,255,255),TEXT_ALIGN_CENTER)
	else
	return
end
end


local Arrested = function() end

usermessage.Hook("GotArrested", function(msg)
	local StartArrested = CurTime()
	local ArrestedUntil = msg:ReadFloat()

	Arrested = function()
		if CurTime() - StartArrested <= ArrestedUntil and localplayer:getDarkRPVar("Arrested") then
		draw.RoundedBox(0,x + 500, y - 50,335,30,Color(40,40,40,250))
		draw.DrawText(DarkRP.getPhrase("youre_arrested", math.ceil(ArrestedUntil - (CurTime() - StartArrested))), "DarkRPHUD1", ScrW()/2, ScrH() - ScrH()/12, Color(255,255,255,255), TEXT_ALIGN_CENTER)
		elseif not localplayer:getDarkRPVar("Arrested") then
			Arrested = function() end
		end
	end
end)

local AdminTell = function() end

usermessage.Hook("AdminTell", function(msg)
    timer.Remove("DarkRP_AdminTell")
    local Message = msg:ReadString()

    AdminTell = function()
        draw.RoundedBox(4, 10, 10, Scrw - 20, 110, colors.darkblack)
        draw.DrawNonParsedText(DarkRP.getPhrase("listen_up"), "GModToolName", Scrw / 2 + 10, 10, colors.white, 1)
        draw.DrawNonParsedText(Message, "ChatFont", Scrw / 2 + 10, 90, colors.brightred, 1)
    end

    timer.Create("DarkRP_AdminTell", 10, 1, function()
        AdminTell = function() end
    end)
end)

--[[---------------------------------------------------------------------------
Drawing the HUD elements such as Health etc.
---------------------------------------------------------------------------]]
local function DrawHUD()
    local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_HUD")
    if shouldDraw == false then return end

    Scrw, Scrh = ScrW(), ScrH()
    RelativeX, RelativeY = 0, Scrh
	xHUD()
    GunLicense()
	DrawAmmo()
    Agenda()
	LockDown()
    DrawVoiceChat()
    Arrested()
    AdminTell()
end

--[[---------------------------------------------------------------------------
Entity HUDPaint things
---------------------------------------------------------------------------]]
-- Draw a player's name, health and/or job above the head
-- This syntax allows for easy overriding
plyMeta.drawPlayerInfo = plyMeta.drawPlayerInfo or function(self)
    local pos = self:EyePos()

    pos.z = pos.z + 10 -- The position we want is a bit above the position of the eyes
    pos = pos:ToScreen()
    if not self:getDarkRPVar("wanted") then
        -- Move the text up a few pixels to compensate for the height of the text
        pos.y = pos.y - 50
    end

    if GAMEMODE.Config.showname then
        local nick, plyTeam = self:Nick(), self:Team()
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
    end

    if GAMEMODE.Config.showhealth then
        local health = DarkRP.getPhrase("health", self:Health())
        draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x + 1, pos.y + 21, colors.black, 1)
        draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x, pos.y + 20, colors.white1, 1)
    end

    if GAMEMODE.Config.showjob then
        local teamname = self:getDarkRPVar("job") or team.GetName(self:Team())
        draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x + 1, pos.y + 41, colors.black, 1)
        draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x, pos.y + 40, colors.white1, 1)
    end

    if self:getDarkRPVar("HasGunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255,255,255,255)
        surface.DrawTexturedRect(pos.x-16, pos.y + 60, 32, 32)
    end
end

-- Draw wanted information above a player's head
-- This syntax allows for easy overriding
plyMeta.drawWantedInfo = plyMeta.drawWantedInfo or function(self)
    if not self:Alive() then return end

    local pos = self:EyePos()
    if not pos:isInSight({localplayer, self}) then return end

    pos.z = pos.z + 10
    pos = pos:ToScreen()

    if GAMEMODE.Config.showname then
        local nick, plyTeam = self:Nick(), self:Team()
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
        draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
    end

    local wantedText = DarkRP.getPhrase("wanted", tostring(self:getDarkRPVar("wantedReason")))

    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x, pos.y - 40, colors.white1, 1)
    draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x + 1, pos.y - 41, colors.red, 1)
end

--[[---------------------------------------------------------------------------
The Entity display: draw HUD information about entities
---------------------------------------------------------------------------]]
local function DrawEntityDisplay()
    local shouldDraw, players = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_EntityDisplay")
    if shouldDraw == false then return end

    local shootPos = localplayer:GetShootPos()
    local aimVec = localplayer:GetAimVector()

    for k, ply in pairs(players or player.GetAll()) do
        if ply == localplayer or not ply:Alive() or ply:GetNoDraw() or ply:IsDormant() then continue end
        local hisPos = ply:GetShootPos()
        if ply:getDarkRPVar("wanted") then ply:drawWantedInfo() end

        if GAMEMODE.Config.globalshow then
            ply:drawPlayerInfo()
        -- Draw when you're (almost) looking at him
        elseif hisPos:DistToSqr(shootPos) < 160000 then
            local pos = hisPos - shootPos
            local unitPos = pos:GetNormalized()
            if unitPos:Dot(aimVec) > 0.95 then
                local trace = util.QuickTrace(shootPos, pos, localplayer)
                if trace.Hit and trace.Entity ~= ply then break end
                ply:drawPlayerInfo()
            end
        end
    end

    local tr = localplayer:GetEyeTrace()

    if IsValid(tr.Entity) and tr.Entity:isKeysOwnable() and tr.Entity:GetPos():DistToSqr(localplayer:GetPos()) < 40000 then
        tr.Entity:drawOwnableInfo()
    end
end

--[[---------------------------------------------------------------------------
Drawing death notices
---------------------------------------------------------------------------]]
function DrawDeathNotice(x, y)
    if not GAMEMODE.Config.showdeaths then return end
end
hook.Add("DrawDeathNotice", "DeathNotice", DrawDeathNotice)
--[[---------------------------------------------------------------------------
Display notifications
---------------------------------------------------------------------------]]
local function DisplayNotify(msg)
    local txt = msg:ReadString()
    GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
    surface.PlaySound("buttons/lightswitch2.wav")

    -- Log to client console
    MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
end
usermessage.Hook("_Notify", DisplayNotify)


--[[---------------------------------------------------------------------------
Disable players' names popping up when looking at them
---------------------------------------------------------------------------]]
function HUDDrawTargetID()
    return false
end
hook.Add("HUDDrawTargetID", "HUDDrawTargetID", HUDDrawTargetID)
--[[---------------------------------------------------------------------------
Actual HUDPaint hook
---------------------------------------------------------------------------]]
function HUDPaint()
    localplayer = localplayer and IsValid(localplayer) and localplayer or LocalPlayer()
    if not IsValid(localplayer) then return end

    DrawHUD()
    DrawEntityDisplay()

end

hook.Add("HUDPaint", "DrawHUD", DrawHUD)