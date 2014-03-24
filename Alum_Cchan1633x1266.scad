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

translate([0,0,H/2])
difference(){
	cube(block, center=true);
	
	translate([0,0,cutH/2+.01])
		cube([L,W-cutW, H-cutH], center=true);
}