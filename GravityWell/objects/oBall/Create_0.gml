/// @description Insert description here
// You can write your code in this editor
enum State {
	Start, // Initial state
	Dragging, // The player is dragging the object to fling it
	Flung // The ball has been flung
}

currState = State.Start;
storeForce = 0;
maxForce = 150;

targetColor = make_color_hsv(0, 200, 250);
startColor = make_color_hsv(70, 200, 255);