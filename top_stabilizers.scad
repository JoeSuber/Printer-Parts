// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end.scad>

module x_end_idler_base(){
 x_end_base();
}

module x_end_idler_holes(){
 x_end_holes();
 translate(v=[0,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=1.8, $fn=30);
 translate(v=[1.5,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 10, r=3.1, $fn=30);
 translate(v=[-21.5,-22,30.25]) rotate(a=[0,-90,0]) rotate(a=[0,0,30]) cylinder(h = 80, r=3.6, $fn=30);
}
 
// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}
difference(){
	union(){
	x_end_idler();
	//translate([0,40,8])
	//	cylinder(r=((3/8)*25.4)/2 + .1, h=16, center=true);
	
	}
	translate([-50,-25,15])
		cube([100,100,100], center=false);
	translate([0,40,8])
		cylinder(r=((3/8)*25.4)/2 + .1, h=30, center=true);
	translate([0,40,4])
		cylinder(r=(12.05)/2 + .1, h=2.1, center=true);
	translate([0,0,7])
	cylinder(r=16.1/2, h=11, center=true);
	translate([-15,22,6]) rotate([90,0,0])
	cylinder(r=4, h=70, center=true);
}


