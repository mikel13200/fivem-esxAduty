local PlayerLevel=nil;
local AdutyStatus=false;
ESX=nil;


Citizen.CreateThread(function()
    while ESX==nil do
        TriggerEvent("esx:getSharedObject",function(obj)
			ESX=obj;
		end)
        Citizen.Wait(0);
    end
end)

RegisterNetEvent("aDuty->Permissions")
AddEventHandler("aDuty->Permissions",function(level)
	if(PlayerLevel~="" or PlayerLevel~=nil)then
		PlayerLevel=level;
	else
		PlayerLevel=0;
	end
end)


RegisterNetEvent("aDuty->Trigger")
AddEventHandler("aDuty->Trigger",function(level)
	if(level and level~=nil and level~=0)then
		local PlayerPed=GetPlayerPed(-1);
		
		if(AdutyStatus==true)then
			AdutyStatus=false;
			ESX.ShowNotification("Admindienst verlassen.");
			
			ESX.TriggerServerCallback("esx_skin:getPlayerSkin",function(skin)
				TriggerEvent("skinchanger:loadSkin",skin);
			end)
		else
			AdutyStatus=true;
			ESX.ShowNotification("Admindienst betreten.");
			
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Tops[1],Config.AdminLevels[level].Tops[2],Config.AdminLevels[level].Tops[3],2)--tops
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Torso[1],Config.AdminLevels[level].Torso[2],Config.AdminLevels[level].Torso[3],2)--torso
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Legs[1],Config.AdminLevels[level].Legs[2],Config.AdminLevels[level].Legs[3],2)--legs
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Shoes[1],Config.AdminLevels[level].Shoes[2],Config.AdminLevels[level].Shoes[3],2)--shoes
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Mask[1],Config.AdminLevels[level].Mask[2],Config.AdminLevels[level].Mask[3],2)--mask
			SetPedComponentVariation(PlayerPed,Config.AdminLevels[level].Undershirt[1],Config.AdminLevels[level].Undershirt[2],Config.AdminLevels[level].Undershirt[3],2)--undershirt
		end
	end
end)