//File: DecHud.hpp
//Author: Decimus
class DecHud {
	idd = -1;
  duration = 1e+1000;
  fadeIn = 0;
  fadeOut = 0;
	onLoad = "uiNamespace setVariable ['DecHud_display', _this select 0];";
	class Controls {
		class Background: IGUIBack
		{
			idc = 2200;

			x = 0.94625 * safezoneW + safezoneX;
			y = 0.892 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.112 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.3};
		};
		class Killstreak: RscText
		{
			idc = 1001;

			text = "0 Kills"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.948 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class Health: RscText
		{
			idc = 1000;
			font = "PuristaBold";

			text = "100%"; //--- ToDo: Localize;
			x = 0.952812 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0,0.5,0,0};
		};
	};
};
