SearchingSecurity = false
SearchingSecurityFinished = false
DisableElectricField = false
DisableElectricFieldFinished = false
robberyActive = false
StopMission = false
RobberyStart = false
pImplant = false
pImplantFinished = false
timer = false
GiveMoney = false
MoneyGiven = false
DoorHacking = false
Counter = 0

ESX=nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	print('[^3ALEN_HUMANE^7]: PLAYER LOADED')
	TriggerServerEvent('alen_humane:state')
	ESX.TriggerServerCallback('alen_humane:getDoorInfo', function(doorInfo, count)
		for localID = 1, count, 1 do
			if doorInfo[localID] ~= nil then
				Config.DoorList[doorInfo[localID].doorID].locked = doorInfo[localID].state
			end
		end
	end)
	
end)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
  end)

  RegisterNetEvent('nui:on')
  AddEventHandler('nui:on', function()
	SetNuiFocus(false, false)
  end)



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	print('[^3ALEN_HUMANE^7]: JOB CHANGE DETECTED')

end)

AddEventHandler('esx:onPlayerDeath', function(data)
	StopMission = true
	Citizen.Wait(5000)
	StopMission = false
end)



--##################
--UselessFunction()
--##################
function EnterAnim(coords) TaskTurnPedToFaceCoord(PlayerPedId(), coords, 1000) end
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

function Marker()
	for k,v in pairs(Config.Marker) do
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true) < 20 then
			DrawMarker(25,v.x, v.y, v.z, 0, 0, 0, 0, 0, 55.0, 1.5, 1.5, 1.5, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)
		end
	end
end

function showHelpNotification()
	for k,v in pairs(Config.Marker) do
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true) < 2 then
			ESX.ShowHelpNotification(v.msg)
		end
	end
end
--##################
--Usefull Game Function()
--##################

function resetAll()
	print('[^3ALEN_HUMANE^7]: VARIABLE RESET INTIATIED')
	SearchingSecurity = false
	SearchingSecurityFinished = false
	DisableElectricField = false
	DisableElectricFieldFinished = false
	robberyActive = false
	StopMission = false
	RobberyStart = false
	pImplant = false
	pImplantFinished = false
	timer = false
	GiveMoney = false
	MoneyGiven = false
	DoorHacking = false
	Counter = 0
	Citizen.Wait(2000)
	print('[^3ALEN_HUMANE^7]: VARIABLE RESET FINISHED')
end



function SecuritySearch()
	robberyActive = true
	SearchingSecurity = true
	local cfgname="Pos1"
	SecurityPed(cfgname)
    RequestAnimDict('mp_arresting')
    while not HasAnimDictLoaded('mp_arresting') do
        Citizen.Wait(10)
    end
    EnterAnim(vector3(Config.Security.x, Config.Security.y, Config.Security.z))
    Citizen.Wait(1500)
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

	exports['progressBars']:startUI(15000, 'Searching For AccessCard')
	Citizen.Wait(15000)
	ClearPedTasks(PlayerPedId())
	PassGen()
	--Trigger Server Event(Give AccessCard)
	SearchingSecurity = false
	SearchingSecurityFinished = true
	TriggerServerEvent('alen_humane:startpolicenotif')
	ESX.ShowNotification('Security Is Down, Lets Now Rob This Shit')

end

function DisableECField()
	SearchingSecurityFinished = false
	DisableElectricField = true
	RequestAnimDict('amb@prop_human_movie_bulb@base')
    while not HasAnimDictLoaded('amb@prop_human_movie_bulb@base') do
        Citizen.Wait(10)
    end
	Citizen.Wait(1500)
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    exports['progressBars']:startUI(3000, 'Accessing Electric Field')
	Citizen.Wait(3000)
	ClearPedTasks(PlayerPedId())
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",6,90,mycb)
end

function mycb(success, timeremaining)
	if success then
		print('[^3ALEN_HUMANE^7]:Success with '..timeremaining..'s remaining.')
		TriggerEvent('mhacking:hide')
		Citizen.Wait(3000)
		local cfgname="Pos2"
		--SecurityPed(cfgname)
		DisableElectricField =false
		DisableElectricFieldFinished = true
		PlantImplant()
	else
		print('[^3ALEN_HUMANE^7]:Failure')
		TriggerEvent('mhacking:hide')
		SearchingSecurityFinished = true
		DisableElectricField = false
		ESX.ShowNotification('Hacking Failed, Try Again..!!')

	end
end

function PlantImplant()
	pImplant = true
	if(DisableElectricFieldFinished == true) then
		RequestAnimDict('amb@prop_human_movie_bulb@base')
		while not HasAnimDictLoaded('amb@prop_human_movie_bulb@base') do
			Citizen.Wait(10)
		end
		Citizen.Wait(1500)
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
		exports['progressBars']:startUI(2000, 'Removing Front Panel')
		Citizen.Wait(3000)
		exports['progressBars']:startUI(4000, 'Placing The Implant')
		Citizen.Wait(5000)
		ClearPedTasks(PlayerPedId())
		--TriggerServerEvent(removechip)
		ESX.ShowNotification('You Have Planted The Chip On Electric Panel.')
		pImplant = false
		pImplantFinished = true
		print (Config.DoorList[1].locked)
		if (Config.DoorList[1].locked == true) then
		Config.DoorList[1].locked = not Config.DoorList[1].locked
		Config.DoorList[2].locked = not Config.DoorList[2].locked
		end

	end
end

function Moneytransfer()
	RobberyStart = true
	pImplantFinished = false
	exports['progressBars']:startUI(4000, 'Checking Up Were Firewall Is Down')
	Citizen.Wait(5000)
	exports['progressBars']:startUI(4000, 'Starting To Transfer Money')
	Citizen.Wait(5000)
	CountTimer()
end

function CountTimer()
	Counter = Config.CountTimer
	timer = true
	Citizen.CreateThread(function()
		while timer do
			Counter = Counter - 1
				if Counter < 1 then
					timer = false
					exports["mythic_notify"]:SendAlert("infrom", "Money Has Been Stacked, Collect It", 6000, {["background-color"] = "#CD472A", ["color"] = "#ffffff"})
					GiveMoney = true
				end	
				Citizen.Wait(1000)
		end
	end)
end

function SecurityPed(Configname)
	RequestModel(Config.Ped[Configname].Pedhash)
	for k,v in pairs(Config.Ped[Configname].PedLocation) do
		AddRelationshipGroup(labalen)
		merryped1 = CreatePed(30, -1275859404, v.x, v.y, v.z, v.h, true, false)
		SetPedArmour(merryped1, 68)
		SetPedAsEnemy(merryped1, true)
		SetPedRelationshipGroupHash(merryped1, labalen)
		GiveWeaponToPed(merryped1, GetHashKey(v.weapon), 250, false, true)
		TaskCombatPed(merryped1, GetPlayerPed(-1))
		SetPedAccuracy(merryped1, Config.Ped[Configname].PedAccuracy)
		SetPedDropsWeaponsWhenDead(merryped1, false)
	end
end

function PassGen()
	local password = math.random(10000, 99999)
	print ('[^3ALEN_HUMANE^7]:Current Password:'..password)
	TriggerServerEvent('alen_humane:setPassword',password )
end

function AccessDoorSecurity()
	DoorHacking = true
	exports['progressBars']:startUI(8000, 'Turning On The System')
	Citizen.Wait(8500)
	exports["mythic_notify"]:SendAlert("error", "Login Failed, You Must Fake Into System Using Fingerprint Hack", 2000, {["background-color"] = "#FFFFFF", ["color"] = "#FF0000"})
	exports['progressBars']:startUI(3000, 'Login Failed')
	Citizen.Wait(3500)
	local levels = math.random(Config.FingerHackingMinLvl, Config.FingerHackingMaxLvl)
	local lifes = math.random(Config.FingerLivesMin, Config.FingerLivesMax)
	TriggerEvent("utk_fingerprint:Start", levels, lifes, 2, function(outcome, reason)
		if outcome == true then
			Citizen.Wait(1000)
			ESX.TriggerServerCallback('alen_humane:getPassword', function(pass)
				exports.pNotify:SendNotification({
					text = "<b style='color:yellow'>Security LOG</b> <br /><br /> <b style='color:red'> ".. "06:00 Mins Ago : Security Down" .."</b><br /> <br /> <b style='color:red'> ".. "04:00 Mins Ago : Malfunction On The Electric Panel" .."</b><br />  <br /> <b style='color:red'> ".. "03:40 Mins Ago : Hacked The Firewall" .."</b><br /> <br /> <b style='color:red'> ".. "03:38 Mins Ago : Lockdown Protocol Intiated, Taskforce Has Been Alerted" .."</b><br /> <br /> <b style='color:red'> ".. "03:30 Mins Ago : New Password Generated" .."</b><br /> <br /><b style='color:yellow'>Security Passlock : </b>"..pass,
					type = "error",
					queue = "error",
					timeout = 15000,
					layout = "bottomRight"
				})
			end)
		elseif outcome == false then
			print("Failed! Reason: "..reason)
		end
	end)
end


function DoorLockState()
	TriggerServerEvent('alen_humane:updateState', 1,Config.DoorList[1].locked)
	TriggerServerEvent('alen_humane:updateState', 2,Config.DoorList[2].locked)
end

--#####################
--Marker,Blips,Text,Help Etc..!
--####################

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		Marker()
		showHelpNotification()
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Security.x, Config.Security.y, Config.Security.z, true) < 3 then
			if IsControlJustReleased(1, 51) then
				if not robberyActive and not StopMission and not SearchingSecurity then
					Citizen.Wait(10)
					SecuritySearch()
				else
					ESX.ShowNotification('A Robbery Is Now Active')
				end

			end
		end
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Electric.x, Config.Electric.y, Config.Electric.z, true) < 2 then
			if IsControlJustReleased(1, 51) then
				if robberyActive and SearchingSecurityFinished and not DisableElectricField and not pImplant and not DisableElectricFieldFinished then
				DisableECField()
				else 
					ESX.ShowNotification('Something Or Nothing Is Happening Here.!')
				end
			end
		end
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Rob.x, Config.Rob.y, Config.Rob.z, true) < 2 then
			if IsControlJustReleased(1, 51) then
				if robberyActive and pImplantFinished and not GiveMoney then
					Config.DoorList[1].locked = not Config.DoorList[1].locked
					Config.DoorList[2].locked = not Config.DoorList[2].locked
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10, 'siren_humane', 0.09)
					exports['mythic_notify']:SendAlert('inform', 'Auto Lock-Down Protocol Intiated, Task Force Has Been Alerted', 15000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					Citizen.Wait(1000)
					Moneytransfer()
				elseif RobberyStart and robberyActive and timer then
						ESX.ShowNotification('Money Collection In Progress, Wait For '..Counter..' Sec')
				elseif GiveMoney and not timer and not MoneyGiven and robberyActive then
					MoneyGiven = true
					robberyActive = false
					--TriggerServerEvent Reward
				end
			end
		end
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Rob.x, Config.Rob.y, Config.Rob.z, true) < 2 then
			if IsControlJustReleased(1, 51) then
				if MoneyGiven and not DoorHacking then
					AccessDoorSecurity()
				end
			end
		end

------------------------------
--##To Update Status Of The Door To All The Player Who Passes A Specific Coods
------------------------------
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 3585.77, 3688.3, 27.62, true) < 1 then 
				DoorLockState(statusdoor)
		end
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 3566.77, 3684.3, 28.62, true) < 1 then
				DoorLockState(statusdoor)
		end

	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if robberyActive and StopMission then
			ESX.ShowNotification('Mission Failed, You Died')
			resetAll()
		end
	end
end)

-----------------------------------------------
--##Door Lock
------------------------------------------------
local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result --Returns the result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

function ToggleDoor(value)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local secretCode = KeyboardInput("Enter the correct security code :", "", 5)
	local dict, anim = 'mp_common_heist', 'a_atm_mugging'
	

	for i=1, #Config.DoorList do
		local doorID   = Config.DoorList[i]
		local distance = GetDistanceBetweenCoords(playerCoords, doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, true)
		local maxDistance = 1.0
		
		if doorID.distance then
			maxDistance = doorID.distance
		end

		if distance < maxDistance then
			if tonumber(secretCode) == nil then
				ESX.ShowNotification("~y~Please enter a valid number.")
				return false
			end

			--Play some animation:
			ESX.Streaming.RequestAnimDict(dict)
			TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)

			--Check if the security code is correct.
			if tonumber(secretCode) == value then
				ESX.ShowNotification("~g~Permission Granted")
				doorID.locked = not doorID.locked
				TriggerServerEvent('alen_humane:updateState', i, doorID.locked) -- Broadcast new state of the door to everyone
			else
				ESX.ShowNotification("~r~Permission Denied")
			end				
		end
	end		
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		for i=1, #Config.DoorList do
			local doorID   = Config.DoorList[i]
			local distance = GetDistanceBetweenCoords(playerCoords, doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, true)
			local maxDistance = 1.0

			if doorID.distance then
				maxDistance = doorID.distance
			end

			if distance < maxDistance then
				ApplyDoorState(doorID)

				local size = 1
				if doorID.size then
					size = doorID.size
				end

				local displayText = 'Open' --Ouvert
				if doorID.locked then
					displayText = 'Lock' --Fermer
				end

				if IsControlJustReleased(0, 38) then
					Citizen.Wait(1000)
					ESX.TriggerServerCallback('alen_humane:getPassword', function(pass)
						print('[^3ALEN_HUMANE^7]:callback'..pass)
						ToggleDoor(pass)
					end)
					--ToggleDoor()
				end
				
				ESX.Game.Utils.DrawText3D(doorID.textCoords, displayText, size)
			end
		end
	end
end)

function ApplyDoorState(doorID)
	local closeDoor = GetClosestObjectOfType(doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, 1.0, GetHashKey(doorID.objName), false, false, false)
	FreezeEntityPosition(closeDoor, doorID.locked)
end

-- Update State of the door
RegisterNetEvent('alen_humane:setState')
AddEventHandler('alen_humane:setState', function(doorID, state)
	Config.DoorList[doorID].locked = state
end)