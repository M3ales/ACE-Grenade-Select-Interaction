#define ADDON MIRA_ACE_GrenadeSelector
#define ADDON_NAME ACE Grenade Selector
#define FUNC(name) ADDON##_fnc_##name
#define ICON_PATH(name) ADDON##\ui\##name##.paa
#define QUOTE(target) #target
#define CONCAT(a,b) a##b
#define COMPILE_FILE(name) compile preprocessFileLineNumbers 'ADDON\##name##.sqf'
#define GVAR(name) ADDON##_##name