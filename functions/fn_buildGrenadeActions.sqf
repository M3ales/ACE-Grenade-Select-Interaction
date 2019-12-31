#include "function_macros.hpp"
params [["_unit", player, [player]], ["_mode", 0]];
if(_mode > 2 || _mode < 0) exitWith {
	LOG_ERROR(format["Invalid mode '%1'", _mode]);
	[]
};
_magazines = magazines _unit;
if(count _magazines == 0) exitWith {
	[]
};
_actions = [];
{
	if(_x in _magazines) then {
		_id = "MIRA_" + _x;
		_name = getText (configFile >> "CfgMagazines" >> _x >> "displayNameShort");
		_icon = getText (configFile >> "CfgMagazines" >> _x >> "picture");
		_action = [_id, _name, _icon, {
			params ["_player", "_target", "_parameters"];
			_parameters params ["_unit", "_grenade"];
			[_unit, _grenade] call FUNC(swapToGrenade);
		}, {true}, {}, [_unit, _x]] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, [], _unit];
	}
}forEach ([ACE_weaponselect_GrenadesAll, ACE_weaponselect_GrenadesFrag, ACE_weaponselect_GrenadesNonFrag] select _mode);
_actions