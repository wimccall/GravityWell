// arg0 = object to apply gravity to

// Get the variables for the force calculation
var ball = argument0;
var runningForceX = 0;
var runningForceY = 0;
for (var i = 0; i < instance_number(oparentGravitySource); i += 1) {
	var GravityObj = instance_find(oparentGravitySource,i);
	var mass = GravityObj.mass;
	var dist = point_distance(ball.phy_position_x, ball.phy_position_y, GravityObj.x, GravityObj.y);
	var gConst = (6.6732 * 10); // 10 times actual G

	// Calculate the force vector
	// Newtons law of universal gravitation:
	//		F = G((mass1* mass2)/distance ^ 2)
	var forceRaw = gConst * (mass/(dist * dist));
	var distVectorX = (ball.phy_position_x - GravityObj.x);
	var distVectorY = (ball.phy_position_y - GravityObj.y);
	distVectorLength = sqrt((distVectorX * distVectorX) + (distVectorY * distVectorY));
	var distVectorNormalizedX = -(distVectorX/distVectorLength);
	var distVectorNormalizedY = -(distVectorY/distVectorLength);
	runningForceX += (distVectorNormalizedX * forceRaw);
	runningForceY += (distVectorNormalizedY * forceRaw);
}

// Limit the magnitude of the force to limit so that it doesn't fly off if distance is very small
var limit = 50;
var length = runningForceX * runningForceX + runningForceY * runningForceY;

if ((length > limit) && (length > 0)) {
	var ratio = limit / sqrt(length);
	runningForceX *= ratio;
	runningForceY *= ratio;
}

// Finally apply the forces based on the calculated normalized sum of force vectors
physics_apply_force(ball.phy_position_x, ball.phy_position_y, runningForceX, runningForceY);