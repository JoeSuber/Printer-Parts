motorH = 66.52;
motorSide = 56.4;
motorSpindle = 33.65;		// top of Round to top spinny part
motorSpinD = 38;
MntD = 47.14;
rodLen = 380;
BigRod = 12.2;
Wl = 7;
boxX = Wl+motorSide+BigRod*2+Wl;
boxY = Wl+8+motorSide+Wl;
boxZ = motorH+motorSpindle/2;
partT = 55;
cubist = [boxX, boxY, boxZ];
tran=0;
unB = 2;
nemaRnd = 38.1;  // nema23 mount-side round
join = 10;  // join-together part making up split
include </home/suber1/MCAD/stepper.scad>;

// rods module places threaded 5/16 at 0,0
module rods(){
translate([0,0,tran])
	cylinder(r=(5/16*24.5)/2, h=rodLen, center=true);  // origin
translate([29,0,tran])
	cylinder(r=15/2, h=rodLen, center=true);				// bearing bar
translate([9,-14,tran])
	cylinder(r=3.4, h=rodLen,center=true);				// 1/4 in hole
translate([-56.4/2-BigRod/2,+rodLen/2,+motorH*.6667]) rotate([90,0,0])
	cylinder(r=BigRod/2, h=rodLen, center=true);		// Y-axis rod
translate([motorSide/2+10,-motorSide/2-5.1,10]) rotate([0,-90,0])
	cylinder(r=4, h=rodLen, center=true);					// structural 5/16
//translate(cubist/2 - [0,5,motorH/2-7.75]) rotate([0,-90,0])
//	cylinder(r=7.3, h=7.5, center=true, $fn=6);			// structural 5/16 nut
translate([motorSide/2+10,+motorSide/2+5.1,10]) rotate([0,-90,0])
	cylinder(r=4, h=rodLen, center=true);					// structural 5/16
//translate(cubist/2 - [0,13.5+motorSide,motorH/2-7.75]) rotate([0,-90,0])
//	cylinder(r=7.3, h=7.5, center=true, $fn=6);			// structural 5/16 nut
translate([-36,0,-(motorH-motorSpindle)/2])				
	cylinder(r=4.08, h=motorH*5,center=true);			// actual bearing bar
//stepper-motor round mount
translate([unB,0,2])
	cylinder(r=nemaRnd/2+.5, h=4.1, center=true, $fn=64);
//m4 holes
translate([MntD/2+unB,MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([MntD/2+unB,-MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([-MntD/2+unB,MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([-MntD/2+unB,-MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
// 1/4 inch holes
translate([-MntD/2-16,-MntD/2,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([-MntD/2-16,MntD/2,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([MntD/2+16,MntD/2-7,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([+MntD/2+16,-MntD/2+7,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
// 1/4 inch nuts
translate([-MntD/2-16,-MntD/2,0])
	cylinder(r=6.35, h=5.6, center=true, $fn=6);
translate([-MntD/2-16,MntD/2,0])
	cylinder(r=6.35, h=5.6, center=true, $fn=6);
translate([MntD/2+16,MntD/2-7,0])
	cylinder(r=6.35, h=5.6, center=true, $fn=6);
translate([+MntD/2+16,-MntD/2+7,0])
	cylinder(r=6.35, h=5.6, center=true, $fn=6);
}// end rods module

module joiner(){

	for (y = [-boxY/2:join:boxY/2+join])
	{
    translate([0, y, 0])rotate([0,0,45])
		cube([join/sqrt(2),join/sqrt(2),100], center=true);
	}
}


module block(){
	difference(){
	union(){
	translate([0,0,(motorH+motorSpindle/2)/2])
		cube(cubist, center=true);
	translate([0,0,partT])
		cube([boxX,boxY,3], center=true);
}
	//translate([2,0,motorH]) rotate([180,0,0])
	//	motor();
	translate([unB,0,partT/2+2]) rotate([180,0,0])
		cube([motorSide+.5,motorSide+.5,partT+.5], center=true);	
	translate([0,0,motorH+motorSpindle/2]) rotate([180,0,0])
		cylinder(r=motorSpinD/2+1, h = motorSpindle, center=true, $fn=25);
	translate([0,0,55]) rotate([90,0,0])
		cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
	translate([0,0,35]) rotate([90,0,0])
		cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
	translate([0,0,35]) rotate([90,0,0])
		cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
	// throwing out some stuff
	translate([0,0,partT]) rotate([0,0,0])
		cube([100,100,70], center=true);
	rods(tran=rodLen/2+motorH);
	// strain relief
	for( y = [-16.5,16.5])
		{
		translate([-43, y, 0])rotate([0,0,0])
			cube([10,1,20], center=true);
		translate([33, y, 0])rotate([0,0,0])
			cube([10,1,20], center=true);
		translate([-43, y*1.5, 20])rotate([0,0,0])
			cube([10,1,25], center=true);
		translate([33, y*0, 20])rotate([0,0,0])
			cube([10,1,20], center=true);
		}
	for( y = [-8,8])
		{
		translate([-34, y*1.5, 0])rotate([0,0,0])
			cube([6,1,50], center=true);
		translate([40, y, 0])rotate([0,0,0])
			cube([6,1,50], center=true);
		translate([-28, y*2.671, 0])rotate([0,0,0])
			cube([4,1,50], center=true);
		translate([46, y *2.671, 0])rotate([0,0,0])
			cube([8,1,50], center=true);
		}
	translate([-46, 0, 0])rotate([0,0,0])
		cube([6,1,50], center=true);
	}
}

module frontblock(){
	echo("x,y,z=", boxX,boxY,boxZ);
	difference(){
		block();
		translate([boxX/4+2+.05, 0, boxZ/2])
		cube([boxX/2+.1, boxY+.1, boxZ+.1], center=true);
	translate([2,-join/2, 0])
		joiner();
	}
}

module backblock(){
	echo("x,y,z=", boxX,boxY,boxZ);
	difference(){
		block();
		translate([2-join/2-boxX/4-.1, 0, boxZ/2])
		cube([boxX/2+.1, boxY+.1, boxZ+.1], center=true);
	translate([2-join/2,0, 0])
		joiner();
	}
}
//block();	
translate([-10,0,47]) rotate([0,-90,0])
frontblock();
translate([0,0,47]) rotate([0,90,0])
backblock();