// Algorithm taken from here: https://www.alanzucconi.com/2016/01/06/colour-interpolation/#acp_wrapper

startColor = argument0;
endColor = argument1;
ratio = argument2;

var color1H = color_get_hue(startColor);
var color1S = color_get_saturation(startColor);
var color1V = color_get_value(startColor);

var color2H = color_get_hue(endColor);
var color2S = color_get_saturation(endColor);
var color2V = color_get_value(endColor);

var calculatedH;
var d = color2H - color1H;
if (d < 0) {
	var h3 = color2H;
	color2H = color1H;
	color1H = h3;
	
	d = -d;
	ratio = 1 - ratio;
}

if (d < 127) {
	color1H += 255;
	calculatedH = (color1H + ratio * (color2H - color1H)) % 255;
} else {
	calculatedH = color1H + ratio * d;
}

return make_color_hsv(calculatedH, (color1S + ratio * (color2S - color1S)), (color1V + ratio * (color2V - color1V)));