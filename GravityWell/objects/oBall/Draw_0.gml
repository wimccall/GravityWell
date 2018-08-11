/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x, y);
if (currState == State.Dragging) {
	storeForce = (point_distance(x, y, mouse_x, mouse_y) / 2); // divide to damp the effect
	if (storeForce > maxForce) storeForce = maxForce;
	
	// Calculate the draw color for the arrow and text
	// Find a color between green and red depending on the force
	var ratio = storeForce / maxForce; // ratio of the way from start to end color
	var col = scriptInterpolateHSV(startColor, targetColor, ratio);
	draw_set_color(col);
	draw_arrow(x, y, x + (x - mouse_x), y + (y - mouse_y), 10);
	draw_text(x - 32, y - 32, storeForce);
}