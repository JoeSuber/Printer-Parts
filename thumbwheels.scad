include </home/suber1/MCAD/gears.scad>

spread = 11.5;
module thumbwheel(){
difference(){translate([0,0,4]) linear_extrude(height = 8.5, center = true, convexity = 10, twist = 0)
	 //gear(number_of_teeth=21,diametral_pitch=1);
gear(21, diametral_pitch=1.1, presure_angle=20, clearance=.275);
translate([0,0,7])
cylinder(r=6.55, h= 6.5, $fn=6, center=true);
translate([0,0,6])
cylinder(r=3.25, h= 20, $fn=36, center=true);
}
}
module fourthumbs(){
rotate([0,0,0]) translate([spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([spread,-spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,-spread,0])
	thumbwheel();
}

fourthumbs();
translate([spread*4,0,0])
fourthumbs();

