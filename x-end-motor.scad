// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// modded for JoePrint and nema23 by Joe Suber

use <x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-15,40,30.5]) cube(size = [17,63,61], center = true);
translate([-15,8.5,58]) rotate([0,90,0])
	cylinder(r=3,h=17,center=true, $fn=12);

// reinforcement cylinder
difference(){
translate([-5.5,10.5,29]) rotate([0,0,0])
	cylinder(r=4,h=58,center=true, $fn=12);
	// reinforcement cylinder cut-away
 translate([-1.5,15,29]) rotate([0,0,0])
	cylinder(r=5,h=58.1,center=true, $fn=12);
}
}

module x_end_motor_holes(){
	n23 = 47.14/2;			//n17 = 15.5
	diff = n23-15.5;
 x_end_holes();
 // Position to place
 translate(v=[-1,32+diff,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  translate(v=[20,-n23,-n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=2.15, $fn=30);
  translate(v=[1,-n23,-n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.65, $fn=30);
 

  translate(v=[20,-n23,n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=2.15, $fn=30);
  translate(v=[1,-n23,n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.65, $fn=30);


  translate(v=[20,n23,-n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=2.15, $fn=30);
  translate(v=[1,n23,-n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.65, $fn=30);


  translate(v=[20,n23,n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=2.15, $fn=30);
  translate(v=[1,n23,n23]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.65, $fn=30);

  // Material saving cutout 
  translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

  // Material saving cutout
  translate(v=[-10,55,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  // Motor shaft cutout
  translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=22, $fn=6);

 }
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

x_end_motor();