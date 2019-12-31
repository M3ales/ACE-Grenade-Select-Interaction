#include "config_macros.hpp"

class CfgPatches {
	class ADDON
	{
		name = QUOTE(ADDON_NAME);
		author = "M3ales";
		url = "https://github.com/M3ales/";
		requiredAddons[] = {"ace_interact_menu"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions {
	class ADDON {
        class ACE_GrenadeSelector {
            tag = QUOTE(ADDON);
            requiredAddons[] = {"ace_interact_menu"};
            file = QUOTE(CONCAT(ADDON,\functions));
			class buildGrenadeActions {};
			class buildLethalGrenadeActions {};
			class buildNonLethalGrenadeActions {};
			class swapToGrenade {};
        };
	};
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class MIRA_GrenadeSelector {
                    displayName = "Grenades";
                    condition = "";
                    statement = "";
                    class MIRA_Lethal {
                        displayName = "Lethal";
                        insertChildren = QUOTE(_this call FUNC(buildLethalGrenadeActions));
                    };
                    class MIRA_NonLethal {
                        displayName = "Non Lethal";
                        insertChildren = QUOTE(_this call FUNC(buildNonLethalGrenadeActions));
                    };
                };
            };
        };
    };
};