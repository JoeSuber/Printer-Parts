// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// modded for JoePrint and nema23 by Joe Suber
use <bearing.scad>
use <polyholes.scad>
rod_distance = 45;

module x_end_base(){
// Main block
height = 58;
translate(v=[-15,-11.5,height/2]) cube(size = [17,44,height], center = true);
// Bearing holder
 vertical_bearing_base();	
//Nut trap
 // Cube
 translate(v=[-2,-30,12.5]) cube(size = [15,40,25], center = true);
 // Hexagon
 translate(v=[0,-40,0]) rotate([0,0,30]) cylinder(h = 20, r=10, $fn = 6);
//Extra Cube
	translate(v=[-7.5,-30.5,34]) cube(size = [4,45,19], center = true);
// extra Rod cube
	translate(v=[-16,-41.5,7.5]) cube(size = [15,17,15], center = true);
}

module x_end_holes(){
 vertical_bearing_holes();
// Belt hole
translate(v=[-1,0,0]){
// Stress relief
translate(v=[-5.5-10+1.5,-10-1,30]) cube(size = [20,1,28], center = true);
difference(){
	translate(v=[-5.5-10+1.5,-10,30]) cube(size = [10,61,28], center = true);

	

	// Nice edges
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,56,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,56,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,56,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,56,28], center = true);

}
}

// Bottom pushfit rod
translate(v=[-15,-61.5,6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,70);
// Top pushfit rod
translate(v=[-15,-41.5,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,50);
// Nut trap
 translate(v=[0,-40,-0.5]) poly_cylinder(h = 20, r=3.25, $fn=25);
 translate(v=[0,-40,4]) rotate([0,0,30]) cylinder(h = 7.1, r=6.33, $fn = 6);
 translate(v=[7.8,-60,21]) rotate(a=[-90,0,0]) pushfit_rod(28,48);
 translate(v=[14.8,-63,35]) rotate(a=[-40,8,-5]) 
	cylinder(h = 42, r=33, $fn = 36, center=true);
translate(v=[-32,-59.5,7.5])
	cylinder(h=100, r=28, center=true, $fn=36);
}


// Final prototype
module x_end_plain(){
 difference(){
  x_end_base();
  x_end_holes();
 }
}

x_end_plain();


module pushfit_rod(diameter,length){
 poly_cylinder(h = length, r=diameter/2);
 difference(){
 	translate(v=[0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
 	translate(v=[0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
 }
 //translate(v=[0,-diameter/2-2,length/2]) cube(size = [diameter,1,length], center = true);
}

