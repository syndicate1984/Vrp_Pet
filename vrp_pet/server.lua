local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_peturimancatiaspulata")
vRPCpeturi = Tunnel.getInterface("vrp_peturimancatiaspulata","vrp_peturimancatiaspulata")

vRPpeturi = {}
Tunnel.bindInterface("vrp_peturimancatiaspulata",vRPpeturi)
Proxy.addInterface("vrp_peturimancatiaspulata",vRPpeturi)

local pet = false

local function papagalnegru(player,choice)
	local user_id = vRP.getUserId({player})
	vRPCpeturi.papagalnegru(player,{})
	pet = true
	vRP.closeMenu({player})
end

local function removepet(player,choice)
	local user_id = vRP.getUserId({player})
	vRPCpeturi.deleteEveryPet(player, {})
	pet = false
end

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		--if vRP.isUserVip({user_id}) then
			choices["Peturi Vip"] = {function(player,choice)
				vRP.buildMenu({"Peturi Vip", {player = player}, function(menu)
					menu.name = "Peturi Vip"
					menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
					menu.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu

					if not pet then
						menu["Papagal Negru"] = {papagalnegru,"Pune petul"}
					else
						menu["Remove pet"] = {removepet,"> Scoate Petul."}
					end
					vRP.openMenu({player,menu})
				end})
			end, "Avantaje"}
		--end
		add(choices)
	end
end})
