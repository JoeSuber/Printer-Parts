// tested for 8mm rod going into 3/8 in. I.D. bronze bushing
// printed .2 mm layer height, black ABS .4 fill, 1.78 fil. diam.
// 4 shells, though that is not likely needed

include </home/suber1/MCAD/gears.scad>

spread = 5;
in=25.4;

module thumbwheel(){
difference(){
translate([0,0,5])
cylinder(r=3/8*in/2, h= 10, $fn=64, center=true);
translate([0,0,5])
cylinder(r=5/16*in/2+.16, h= 10.1, $fn=36, center=true);
}
}
module fourby(){
rotate([0,0,0]) translate([spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([spread,-spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,-spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*spread,-spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*-spread,spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*-spread,-spread,0])
	thumbwheel();
rotate([0,0,0]) translate([spread,3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([spread,-3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-spread,-3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-3*spread,3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([-3*spread,-3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*spread,3*spread,0])
	thumbwheel();
rotate([0,0,0]) translate([3*spread,-3*spread,0])
	thumbwheel();
}

fourby();