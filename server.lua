local PlayerLevel={};
ESX=nil;


TriggerEvent("esx:getSharedObject",function(obj)
	ESX=obj;
end)

ESX.RegisterServerCallback("Admin:getRankFromPlayer",function(source,cb)
	local src=source;
    local player=ESX.GetPlayerFromId(src);
	local cb={};

    if(player~=nil)then
        local playerGroup=player.getGroup();

        if(playerGroup~=nil)then 
            cb(playerGroup);
        else
            cb("user");
        end
    else
        cb("user");
    end
end)


RegisterCommand("aduty",function(source,args)
	local src=source;
	print("1")
	
	local xPlayer=ESX.GetPlayerFromId(src)
    if(xPlayer.getGroup()=="support")then
		PlayerLevel[src]=1;
	elseif(xPlayer.getGroup()=="mod")then
		PlayerLevel[src]=2;
	elseif(xPlayer.getGroup()=="admin")then
		PlayerLevel[src]=3;
	elseif(xPlayer.getGroup()=="admin")then
		PlayerLevel[src]=4;
	else
		PlayerLevel[src]=nil;
	end
	TriggerClientEvent("aDuty->Trigger",src,PlayerLevel[src]);
end)