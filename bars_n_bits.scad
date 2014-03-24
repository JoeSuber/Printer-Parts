// attach things to base...

use <./Abar.scad>
//include <./Abar.scad>


module hangbase(cB=25){
	difference(){
		union(){
		translate([0,0,cB/2])
			cube([cB,cB,cB], center=true);			// cube in alluminum
		translate([0,0,cB+cB/6])
			cube([cB,cB,cB/3], center=true); 		// stick up above the abar
		translate([0,0,cB+cB/4]) rotate([0,90,0])
			sphere(r=cB/1.4, center=true, $fn=24); // nothing to sphere!
		translate([-(cB/2+cB/18),0,cB/1.414])
			cube([cB/4,cB,cB*1.414], center=true);	// lay back to print
		}
			// caprive nut for bottom-bolt
		hull(){
			translate([0,0,cB/2])
				cylinder(r=6.4, h=5.6, center=true, $fn=6); //captured nut
			translate([15,0,cB/2])
				cylinder(r=6.4, h=5.6, center=true, $fn=6); 
		}
			// 1/4inch bolt from below
			translate([0,0,0])
				cylinder(r=3.2, h=cB*2+.1, center=true, $fn=16);
			// Big 12mm top Bar
			translate([0,0,cB*1.5+.2]) rotate([0,90,0])
				cylinder(r=6.15, h=cB*3+.1, center=true, $fn=16);
			// 5/16 or 8mm rod w/ captive nuts
			translate([0,0,cB*1.12]) rotate([0,90,90])
				cylinder(r=4.1, h=cB*3+.1, center=true, $fn=16);
			translate([0,-cB/2-6.8/2,cB*1.12]) rotate([0,90,90])
				cylinder(r=7.1, h=6.8, center=true, $fn=6);
			translate([0,cB/2+6.8/2,cB*1.12]) rotate([0,90,-90])
				cylinder(r=7.1, h=6.8, center=true, $fn=6);
			// m4 side-punch holes
			translate([-10,0,cB*.3333 -1]) rotate([0,90,90])
				cylinder(r=2, h=cB*3+.1, center=true, $fn=8);
			translate([6,0,cB*.3333 -1]) rotate([0,90,90])
				cylinder(r=2, h=cB*3+.1, center=true, $fn=8);
			// flatten up the back
			translate([-(cB/2+cB/18)-cB/4,0,cB/1.414])
				cube([cB/4,cB,cB*1.414], center=true);
	}
}

difference(){
	hangbase();
	abar();
	translate([60+((mW+pad)/2),0,0]) rotate([0,0,90])
		abar(bblock=[40,W,H]);
}
