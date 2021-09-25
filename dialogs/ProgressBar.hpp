//File: ProgressBar.hpp
//Author: Decimus

//Had to do alot of searching but eventaly got this working
class ProgressBar {
	name = "ProgressBar";
	idd = 15000;
	fadein=0;
	duration = 1e+1000;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['ProgressBar',_this select 0]";
	class Controls {
		class ProgressBar: RscProgressBar {
			idc = 1000;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.066  * safezoneH + safezoneY;
			w = 0.525  * safezoneW;
			h = 0.042  * safezoneH;
		};
		class ProgressText: RscProgressText {
			idc = 1001;
			fade = 0;
			x = 0.24   * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.525  * safezoneW;
			h = 0.042  * safezoneH;
			text = "";
		};
	};
};
