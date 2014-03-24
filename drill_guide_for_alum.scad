// generate C-channel for later use in cut-outs

mW = 16.33;
mH = 12.66;
L = 120;
pad=.1;
W = mW+pad;
H = mH+pad;
block = [L,W,H];
cutW = (1.5 * 2) + (pad * 2);
cutH = (2.0 + pad);
n23W = 56.4;
n23mounts = 47.14 / 2;
n23circleD = 38.1;
offL = n23circleD - n23mounts - 4;
n23hypholes = n23mounts * sqrt(2);  // diagonal to center from mount

difference(){
translate([0,0,(H+5.5)/2 + .01])
cube([n23W,W*1.5,H+5.5], center=true);

	cylinder(r=1.2,h=H*3,center=true);
	translate([n23mounts,0,0])
	cylinder(r=1.2,h=H*3,center=true);
	translate([-n23mounts,0,0])
	cylinder(r=1.2,h=H*3,center=true);
	translate([-offL,0,0])
	cylinder(r=1.5,h=H*3,center=true);
	translate([n23hypholes-n23mounts,0,0])
	cylinder(r=1.2,h=H*3,center=true);
	translate([n23hypholes-n23mounts-5,5,0])
	cylinder(r=1.2,h=H*3,center=true);
	translate([0,0,H/2])
	difference(){
		cube(block, center=true);
	
		translate([0,0,cutH/2+.01])
			cube([L,W-cutW, H-cutH], center=true);
	}
}