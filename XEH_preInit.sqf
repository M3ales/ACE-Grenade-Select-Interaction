#include "functions\function_macros.hpp"
LOG("PreInit Begin");

LOG("Creating CBA Addon Options");

//General
[QUOTE(GVAR(EquipGrenade)), "CHECKBOX", ["Equip Grenade", "Determines if Grenade will be Equipped automatically using ACE Throwing when selected"], ["ACE Grenade Selector"], true, 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(QuickSelect)), "CHECKBOX", ["Grenade Interact at Root", "Determines if the interact will be displayed at the self interact Root, or under Equipment"], ["ACE Grenade Selector"], false, 0, {}] call CBA_fnc_addSetting;

LOG("PreInit Complete");