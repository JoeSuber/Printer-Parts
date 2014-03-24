motorH = 66.52;
motorSide = 56.4;
motorSpindle = 33.65;		// top of Round to top spinny part
motorSpinD = 38;
MntD = 47.14;
rodLen = 380;
BigRod = 12.2;
Wl = 7;
cubist = [Wl+motorSide+BigRod*2+Wl, Wl+8+motorSide+Wl, motorH+motorSpindle/2];
include </home/suber1/MCAD/stepper.scad>;

// rods module places threaded 5/16 at 0,0
module rods(tran=0){
translate([0,0,tran])
	cylinder(r=(5/16*24.5)/2, h=rodLen, center=true);  // origin
translate([29,2,tran])
	cylinder(r=15/2, h=rodLen, center=true);				// bearing bar
translate([9,-14,tran])
	cylinder(r=3.4, h=rodLen,center=true);				// 1/4 in hole
translate([-56.4/2-BigRod/2,+rodLen/2,+motorH*.6667]) rotate([90,0,0])
	cylinder(r=BigRod/2, h=rodLen, center=true);		// Y-axis rod
translate([motorSide/2+10,-motorSide/2-5.1,10]) rotate([0,-55,0])
	cylinder(r=4, h=rodLen, center=true);					// structural 5/16
translate(cubist/2 - [0,5,motorH/2-7.75]) rotate([0,-90,0])
	cylinder(r=7.3, h=7.5, center=true, $fn=6);			// structural 5/16 nut
translate([motorSide/2+10,+motorSide/2+5.1,10]) rotate([0,-90,0])
	cylinder(r=4, h=rodLen, center=true);					// structural 5/16
translate(cubist/2 - [0,13.5+motorSide,motorH/2-7.75]) rotate([0,-90,0])
	cylinder(r=7.3, h=7.5, center=true, $fn=6);			// structural 5/16 nut
translate([-40,0,-(motorH-motorSpindle)/2])				
	cylinder(r=4.08, h=motorH*5,center=false);			// actual bearing bar
//m4 holes
translate([MntD/2,MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([MntD/2,-MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([-MntD/2,MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
translate([-MntD/2,-MntD/2,0])
	cylinder(r=2.1, h=120, center=true, $fn=6);
// 1/4 inch holes
translate([-MntD/2-20,-MntD/2,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([-MntD/2-20,MntD/2,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([MntD/2+12,MntD/2-7,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([+MntD/2+12,-MntD/2+7,0])
	cylinder(r=3.4, h=120, center=true, $fn=12);
translate([-MntD/2-20,-MntD/2,0])
	cylinder(r=3.3, h=5.6, center=true, $fn=6);
translate([-MntD/2-20,MntD/2,0])
	cylinder(r=3.3, h=5.6, center=true, $fn=6);
translate([MntD/2+12,MntD/2-7,0])
	cylinder(r=3.3, h=5.6, center=true, $fn=6);
translate([+MntD/2+12,-MntD/2+7,0])
	cylinder(r=3.3, h=5.6, center=true, $fn=6);
}// end rods module
module allthebs(){
//difference(){
//translate([-4,0,(motorH+motorSpindle/2)/2])
//	cube(cubist, center=true);
translate([0,0,motorH]) rotate([180,0,0])
	motor();
translate([0,0,motorH/2]) rotate([180,0,0])
	cube([motorSide+.5,motorSide+.5,motorH+.5], center=true);	
translate([0,0,motorH+motorSpindle/2]) rotate([180,0,0])
	cylinder(r=motorSpinD/2+1, h = motorSpindle, center=true, $fn=25);
translate([0,0,55]) rotate([90,0,0])
	cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
translate([0,0,35]) rotate([90,0,0])
	cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
translate([0,0,35]) rotate([90,0,0])
	cylinder(r=motorSpinD/3, h = 120, center=true, $fn=48);
translate([0,0,55]) rotate([0,0,0])
	cube([55,200,70], center=true);
rods(tran=rodLen/2+motorH);
//}
}
module sheet(){
difference(){
	translate([-4,,0,-1.67])
	cube([96,60,2], center=true);
	cylinder(r=(1.5*25.4)/2+.2,h=10,center=true);
	//translate([47.14/4,47.14/4,-3])
	//cylinder(r=10,h=10,center=true);
	//translate([-47.14/4,47.14/4,-3])
	//cylinder(r=10,h=10,center=true);
	//translate([47.14/4,-47.14/4,-3])
	//cylinder(r=10,h=10,center=true);
	//translate([-47.14/4,-47.14/4,-3])
	//cylinder(r=10,h=10,center=true);
	allthebs();
	}
}

translate([0,0,2])
rotate([0,0,0])
sheet();
/*
translate([0,0,0])
rotate([90,0,0])
sheet();
translate([0,-4,0])
rotate([90,0,0])
sheet();
translate([5,1.5,0])
rotate([0,90,0])
cube([60,10,1], center=true);
translate([-5,1.5,0])
rotate([0,90,0])
cube([60,10,1], center=true);
translate([-0,1.5,0])
rotate([0,70,0])
cube([45,10,1], center=true);
*/