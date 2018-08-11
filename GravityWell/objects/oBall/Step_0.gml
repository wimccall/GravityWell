/// @description Insert description here

switch(currState) {
	case State.Start: {
		// Do nothing
	} break;
	case State.Dragging: {
		if(mouse_check_button_released(mb_left)) {
			currState = State.Flung; // Switch to flung, since we released the mouse button
			var distX = x - mouse_x;
			var distY = y - mouse_y;
			distLength = sqrt((distX * distX) + (distY * distY));
			var distXNorm = distX / distLength;
			var distYNorm = distY / distLength;
			physics_apply_impulse(phy_position_x, phy_position_y, (distXNorm * storeForce), (distYNorm * storeForce));
		}
	} break;
	case State.Flung: { 
		scriptApplyGravity(id); // Apply gravity to this object
	} break;
	default: {
		show_debug_message("unimplemented ball state!");
	} break;
}