#include "function_macros.hpp"
params["_unit", "_grenade"];
_currentThrowable = currentThrowable _unit;
if(_currentThrowable isEqualTo []) then {
	LOG("No Throwable Selcted");
	_currentThrowable = ["", ""];
};

if(_grenade isEqualTo (_currentThrowable select 0)) exitWith {
	LOG("Skipping swap, already have requested grenade selected.");
};

_uniformGrenades =  uniformItems  _unit select {_x in ACE_weaponselect_GrenadesAll && {_x != _grenade}};
_vestGrenades =     vestItems     _unit select {_x in ACE_weaponselect_GrenadesAll && {_x != _grenade}};
_backpackGrenades = backpackItems _unit select {_x in ACE_weaponselect_GrenadesAll && {_x != _grenade}};

{_unit removeItemFromUniform  _x; false} count _uniformGrenades;
{_unit removeItemFromVest     _x; false} count _vestGrenades;
{_unit removeItemFromBackpack _x; false} count _backpackGrenades;

{_unit addItemToUniform  _x; false} count _uniformGrenades;
{_unit addItemToVest     _x; false} count _vestGrenades;
{_unit addItemToBackpack _x; false} count _backpackGrenades;

_currentGrenade = _currentThrowable select 0;

LOG(format["Swapped to Grenades"]);