include </home/suber1/MCAD/gears.scad>

spread = 12;
teeth = 23;
dp = 1.1;
pi = 3.141592654;
crad = (teeth*dp/pi)/2;
pad = 0.1;	// Padding to maintain manifold
ch = 1;
cr = 17.5;
ct = 2;
r = 3.15;
smooth = 64;	// Number of facets of rounding cylinder

module toroid(){
//difference() {
//	rotate_extrude(convexity=10,  $fn = smooth)
//		translate([cr-ct-r+pad,ct-pad,0])
//			square(r+pad,r+pad);
	rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r,ct+r,0])
			circle(r=r,$fn=smooth);
//}
}

module wind_ring(){
difference(){
cylinder(r = crad*2+4, h=2,center=true, $fn=48);
cylinder(r = crad*2+4-2.4, h=2, center=true, $fn=36);
}
}



module thumbwheel(){
difference(){translate([0,0,5]) linear_extrude(height = 8.5, center = true, convexity = 10, twist = 0)
	 //gear(number_of_teeth=21,diametral_pitch=1);
gear(teeth, diametral_pitch=dp, presure_angle=20, clearance=.275);
translate([0,0,5]) rotate([0,90,90]);
	cylinder(r=.66, h= 20, $fn=12, center=true);
translate([0,0,-10]) rotate([180,0,0]);
toroid();
translate([0,0,0]) rotate([0,180,0]);
toroid();
translate([0,0,6.5])
cylinder(r=6.59, h= 6.5, $fn=6, center=true);
//translate([0,0,6])
//wind_ring();
translate([0,0,7])
	cylinder(r=3.25, h= 20, $fn=36, center=true);
// threadhole
translate([0,0,5]) rotate([0,90,90]);
	cylinder(r=.66, h= 20, $fn=12, center=true);
}
}
module fourthumbs(){
rotate([0,180,0]) translate([spread,spread,0])
	thumbwheel();
rotate([0,180,0]) translate([spread,-spread,0])
	thumbwheel();
rotate([0,180,0]) translate([-spread,spread,0])
	thumbwheel();
rotate([0,180,0]) translate([-spread,-spread,0])
	thumbwheel();
}


echo("teeth*pitch/pi/2 =",crad);
fourthumbs();


