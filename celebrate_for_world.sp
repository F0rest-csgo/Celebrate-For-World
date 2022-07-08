#pragma semicolon 1

#define PLUGIN_AUTHOR "F0rest"
#define PLUGIN_VERSION "2022-07-08"

#include <sourcemod>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Celebrate For World",
	author = PLUGIN_AUTHOR,
	description = "Celebrate for world plugin - build on 2022-07-08",
	version = PLUGIN_VERSION,
	url = "https://github.com/F0rest-csgo"
};

public void OnPluginStart()
{
	HookEvent("player_death", OnClientDeath);
}

public void OnClientDeath(Event event, const char[] name, bool dontBroadcast)
{
	int attacker = GetClientOfUserId(event.GetInt("attacker"));
	if(!IsClientInGame(attacker) || IsFakeClient(attacker)) return;
	char weapon[128];
	event.GetString("weapon", weapon, sizeof(weapon));
	if(StrContains(weapon, "revolver", false) == -1 && StrContains(weapon, "sawedoff", false) == -1) return;
	
	SetEntProp(attacker, Prop_Send, "m_iAccount", 16000);
}
