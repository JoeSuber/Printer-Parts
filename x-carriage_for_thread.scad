// PRUSA iteration3
// X carriage
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// thread & ratchet mods by Joe Suber

use <./bearing.scad>
use </home/suber1/Things/x-carriage_thread_plug.scad>
TEMP=0;
module x_carriage_base(){
 // Small bearing holder
 translate([-33/2,0,0]) rotate([0,0,90]) minkowski(){horizontal_bearing_base(1); cylinder(r=.9, h=.1, $fn=16);}
 // Long bearing holder
 translate([-33/2,45,0]) rotate([0,0,90]) minkowski(){horizontal_bearing_base(2); cylinder(r=.9, h=.1, $fn=16);}
 // Base plate (rounded) base
 translate([-33,-11.5,0]) minkowski(){cube([33,68,7]);cylinder(r=.9, h=.1, $fn=16);}
 // Belt holder (rounded) base
 translate([-33,19,0]) minkowski(){cube([33,16,16]); cylinder(r=.9, h=.1, $fn=16);}
}

module x_carriage_beltcut(){
 // Cut in the middle for belt
 //translate([-2.5-16.5+1,19,7]) cube([4.5,13,15]);
 // Cut clearing space for the belt
 translate([-38,5,7]) cube([40,13,15]);
 // Belt slit
 //translate([-66,21.5+10,6]) cube([67,1,15]);
 // Smooth entrance
 //translate([-66,21.5+10,14]) rotate([45,0,0]) cube([67,15,15]);
 // Teeth cuts
 //for ( i = [0 : 23] ){
 // translate([0-i*3,21.5+8,6]) cube([1.7,3,15]);
 //}
// incoming threads
translate([-28,30,11]) rotate([0,90,0])
	cylinder(r=.75, h=15, center=true, $fn=12);
translate([-5,26.8,10]) rotate([0,90,0])
	cylinder(r=.75, h=15, center=true, $fn=12);
}

module x_carriage_holes(){
 // Small bearing holder holes cutter
 translate([-33/2,0,0]) rotate([0,0,90]) horizontal_bearing_holes(1);
 // Long bearing holder holes cutter
 translate([-33/2,45,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
  // Extruder mounting holes
  translate([-16.5+12,24,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5+12,24,10])cylinder(r=3.1, h=20, $fn=6); 
  translate([-16.5-12,24,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5-12,24,10])cylinder(r=3.1, h=20, $fn=6); 	
}

module x_carriage_fancy(){
 // Top right corner
 translate([13.5,-5,-1]) translate([0,45+11.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom right corner
 translate([0,5,-1]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-33,5,-1]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-33-13.5,-5,-1]) translate([0,45+11.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);	
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  x_carriage_beltcut();
  x_carriage_holes();
  x_carriage_fancy();
translate([-5.5,27,22])rotate([180,0,0])
	conekey();
// cutting off ratchet part here to print on the side
translate([-18,28,15.4]) rotate([0,0,0])
cube([38,20.5,5], center=true);
 }
}

x_carriage();
// turning part
translate([10,5,4])
conekey_fit();
// ratchet plate as seperate item makes it easier to print
translate([10,13,.2]) rotate([0,0,0])
difference(){
translate([-27,-15.5,17.5]) rotate([0,180,90])
plate();
/*translate([-55,1,7.1]) rotate([0,180,90])
cube([38,23,6], center=true);
translate([-55,1,-.8]) rotate([0,180,90])
cube([38,23,1], center=true);
*/
}

