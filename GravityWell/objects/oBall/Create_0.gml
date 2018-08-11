/// @description Insert description here
// You can write your code in this editor
enum State {
	Start, // Initial state
	Dragging, // The player is dragging the object to fling it
	Flung // The ball has been flung
}

currState = State.Start;
storeForce = 0;