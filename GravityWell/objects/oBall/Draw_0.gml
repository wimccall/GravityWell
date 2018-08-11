/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x, y);
if (currState == State.Dragging) {
	storeForce = (point_distance(x, y, mouse_x, mouse_y) / 2); // divide to damp the effect
	draw_arrow(x, y, x + (x - mouse_x), y + (y - mouse_y), 10);
	draw_text(x - 16, y - 16, storeForce);
}