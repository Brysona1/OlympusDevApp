//Had to do alot of searching but eventaly got this working
class RscProgressText {
	fade = 1;
	x = 0.24   * safezoneW + safezoneX;
	y = 0.0635 * safezoneH + safezoneY;
	w = 0.525  * safezoneW;
	h = 0.042  * safezoneH;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaMedium";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 0};
};
class RscProgressBar {
	type = 8;
	style = 0;
	shadow = 2;
	texture = "";
	colorFrame[] = {0, 0, 0, 1};
	colorBackground[] = {0,0,0,0.7};
	colorBar[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
	};
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.066  * safezoneH + safezoneY;
	w = 0.525  * safezoneW;
	h = 0.042  * safezoneH;
};
