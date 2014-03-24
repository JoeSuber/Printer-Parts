// inside 15.85mm (interior) aluminium bar,
// 1/4in nuts insert to let 1/4in bolts hug 5/16in rod
// perhaps epoxy the whole thing in place...
// gorrilla-glue worked well - Joe

interior=15.85;
echo("interior dimension of square-tube =", interior);
rods=(5/16)*25.4+.1;
rodsnut=7.5;
echo("angled rods diameter =", rods, " nut radius=", rodsnut);
grip=(1/4)*25.4+.15;
gripnut= 6.55;
echo("gripper bolt diameter=", grip, " nut radius=", gripnut);

module barRod(ang=12.7){
	echo("incident angle of rod=",ang, "deg");
	nutH = 6.7;
	nutoff=sin(ang)*(interior/2 - nutH/2);
	difference(){
	rotate([90,0,0])
		cube([interior,interior,interior*3], center=true);

	translate([0,8,0]) rotate([ang,90,0])
		cylinder(r=rods/2, h=interior*3, center=true, $fn=36);
	translate([(interior/2 - nutH/2),8-nutoff,0]) rotate([ang,90,0])
		cylinder(r=rodsnut, h=9.5, center=true, $fn=6);
	translate([0,0,0]) rotate([90,0,0])
		cylinder(r=grip/2, h=interior*3, center=true, $fn=36);
	hull(){
		translate([0,-10,0]) rotate([90,0,0])
			cylinder(r=gripnut, h=5.75, center=true, $fn=6);
		translate([12,-10,0]) rotate([90,0,0])
			cylinder(r=gripnut, h=5.75, center=true, $fn=6);
	}
	hull(){
		translate([0,17,0]) rotate([90,0,0])
			cylinder(r=gripnut, h=5.75, center=true, $fn=6);
		translate([12,17,0]) rotate([90,0,0])
			cylinder(r=gripnut, h=5.75, center=true, $fn=6);
	}
	}
}

translate([0,0,interior/2]) rotate([0,-90,0])
barRod();
