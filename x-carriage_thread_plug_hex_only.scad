/* 
// original source of some things = demo.scad from RatchetLib
*/
use </home/suber1/Things/DXFs and SCADs/bearing.scad>;
use <./Parametric_Ratchet_Library/RatchetLib.scad>;
//use <../thumbwheel_thread_tensionwheel.scad>

// inner (teeth) ring
inner_ring_diameter=13.65;		// outer diameter of the inner ring
inner_ring_height=5;		// height of the inner ring
inner_ring_thickness=6;		// thickess of the inner ring

// outer (arms) ring
outer_ring_diameter=18;		// outer diameter of the outer ring
outer_ring_height=17;		// height of the outer ring
outer_ring_thickness=1.5;		// thickness of the outer ring

// arms for outer ring (and cutting ratchet teeth on inner ring)
arm_type="straight";		// the arm type (currently straight only, eventually curved will be an option)
arms=5;					// total number of radially symmetric arms 
teeth_multiple=2;			// how many times more teeth than arms we will have
arm_height=17;				// height of the arm
arm_head_width=0.7;			// size of the head of the arm
arm_head_length=2;			// length of the arm head
arm_shaft_width=.9;			// width of non-head part of the arm

// other settings
ratchet_direction="clockwise"; // which way the outer ring should be able to move-.5
slant=0;					// slant in degrees of the ratchet arm head, values between 0 and 50 are usable
tolerance=0.3;				// padding around arm head with when cutting ratchet teeth
facets=64;				// number of facets for cylinders

holderT = 8; // inner_ring_diameter
ORD=11;
ORH=17;
ORT=1.5;
capH=5; // cap is the part on key we hold on to to turn it
// =======================================================================

module ratcheteeth(){
echo("outer ring Diam=",outer_ring_diameter);
outer_ratchet_ring(
	ratchet_direction,
	inner_ring_diameter,
	inner_ring_height,
	inner_ring_thickness,
	outer_ring_diameter,
	outer_ring_height,
	outer_ring_thickness,
	arms,
	arm_type,
	arm_head_width,
	arm_head_length,
	arm_shaft_width,
	arm_height,
	tolerance,
	slant,
	facets
	);
}

module keymaster(){
//translate([outer_ring_diameter,0,holderT/2])
inner_ratchet_ring(
	ratchet_direction,
	inner_ring_diameter,
	inner_ring_height,
	inner_ring_thickness,
	outer_ring_diameter,
	outer_ring_height,
	outer_ring_thickness,
	arms,
	arm_type,
	arm_head_width,
	arm_head_length,
	arm_height,
	teeth_multiple,
	tolerance,
	slant,
	facets);
//translate([outer_ring_diameter,0, holderT/4+.33])
//	minkowski(){
//	cube([holderT*.8,holderT*1.8,holderT/2-2], center=true);
//	cylinder(r=1, h=holderT/4, $fn=16, center=true);
//	}
}

// negative mold for capping the x-carriage cut-out
module mold(){
	difference(){
	translate([0,0,.1])
	cylinder(r=outer_ring_diameter/2-.1, h=capH+1, $fn=48);
	ratcheteeth();
	}
}

module conekey(){
translate([-ORD,0, 0])
difference(){
	union(){
		// ** ratchet key indention
		translate([0,0,holderT/2])
			cylinder(r=holderT+.35, h=8, $fn=6);

		// ** slightly bigger than final part, with offset rings
		// ** so that key will 'lock' thread-bundles in place when pressed
		translate([0,0,holderT/2+5])  // fat part
			cylinder(r=ORD/2+tolerance/2, h=8, $fn=36);
		translate([0,0,holderT+12.7])  // m3 hex head in base
			cylinder(r=2.9, h=3, center=true, $fn=16);
		translate([0,0,holderT/2+5])		// thread ring
			cylinder(r1=ORD/2+tolerance/2, r2=ORD/2+tolerance/2 + .75, h = 2, $fn=36);
		translate([0,0,holderT/2+7])		// thread ring
			cylinder(r1=ORD/2+tolerance/2, r2=ORD/2 +tolerance/2+ .75, h = 2, $fn=36);
	} 
	// ** cone cut-out as base
	translate([0,0,holderT/2+12-5])
		cylinder(r1=2-tolerance, r2=ORD/2-tolerance/2 - 1, h = 6.1, $fn=64);
	}
		translate([-ORD,0,holderT])		// m3 shaft
			cylinder(r=1.6, h=80, center=true, $fn=16);
}

module conekey_fit(){
	TEMP = 0;  // for using previously printed different part
	echo("temp is",TEMP);
difference(){
	union(){
		//translate([0,0,holderT/2])
		//	cube([holderT*.67,holderT*1.617,holderT/2],center=true);
		//translate([0,0,holderT/2])
		//	cube([holderT*1.617,holderT*.67,holderT/2],center=true);
		
		translate([0,0,0 - TEMP/2])
			cylinder(r=holderT, h=capH+capH -2 -TEMP, center=true, $fn=6);
		translate([0,0,capH - TEMP])
			cylinder(r=holderT, h=capH+capH -2 -TEMP, center=true, $fn=6);
		translate([0,0,holderT/2+5])
			cylinder(r=ORD/2-tolerance, h=8, $fn=36);
	}
	// bottom cone cut-out in key - bigger cut than in blank
	translate([0,0,holderT/2+12-5])
		cylinder(r1=2+tolerance, r2=ORD/2+tolerance/2 - 1, h = 6.1, $fn=64);
	translate([0,0,0])
		cylinder(r=1.6, h=80, center=true, $fn=16);
	translate([0,0,12]) rotate([95,0,0])
		cylinder(r=.6, h=80, center=true, $fn=16);
	translate([0,3,12]) rotate([5,0,0])
		cylinder(r=.6, h=80, center=true, $fn=16);
	translate([0,-3,12]) rotate([-5,0,0])
		cylinder(r=.6, h=80, center=true, $fn=16);
	translate([0,0,12]) rotate([95,0,0])
		cylinder(r=.6, h=80, center=true, $fn=16);
	translate([0,0,-3])
		cylinder(r=3.1, h=7, center=true, $fn=6);
	translate([0,0,holderT/2+7])
		// a rough torus to make ring indents
		//minkowski(){
			difference(){
				cylinder(r=ORD/2+.5, h = 1, center=true, $fn=48);
				cylinder(r=ORD/2-.117, h = 1, center=true, $fn=36);
			}
		//	sphere(r=.5);
		//}
	translate([0,0,holderT/2+9])
	//minkowski(){
			difference(){
				cylinder(r=ORD/2+.5, h = 1, center=true, $fn=48);
				cylinder(r=ORD/2-.117, h = 1, center=true, $fn=36);
			}
		//	sphere(r=.5);
		//}
	} // end big dif

}

// negative mold for capping the x-carriage cut-out
module mold(){
	difference(){
	translate([0,0,.1])
	cylinder(r=outer_ring_diameter/2-.1, h=capH, $fn=48);
	ratcheteeth();
	}
}

//** manually copied relavent items from x-carriage_for_thread.scad
//** note 'top' of plate here will be face down against x-carriage
module plate(){
difference(){
	translate([-33,19,15.5-capH/2]) minkowski(){
		cube([33,18,capH-.3]); cylinder(r=.9, h=.1, $fn=16);}
	translate([-5.5,27.667,22])rotate([180,0,0])
		conekey();
  	translate([-16.5+12,25,-1])cylinder(r=1.7, h=20, $fn=8);
	translate([-16.5-12,25,-1])cylinder(r=1.7, h=20, $fn=8);
 	translate([-33/2,44,3.5]) rotate([0,-60,90])  
		minkowski(){
			horizontal_bearing_base(2); cylinder(r=.9, h=.1, $fn=16);}
	translate([-16.5+6.1,37.5,15])rotate([-15,0,0])
		cube([2.5,4.5,30], center=true);
	translate([-16.5-6.1,37.5,15])rotate([-15,0,0])
		cube([2.5,4.5,30], center=true);
	translate([-16.5-12,25,16])cylinder(r=5.1, h=5, $fn=24);
 	translate([-16.5+12,25,16])cylinder(r=5.1, h=5, $fn=24);
  translate([-16.5+12,33,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5-12,33,-1])cylinder(r=1.7, h=20, $fn=8);
	}
}
module plate2x(){
difference(){
	union(){
		plate();
		translate([0,0,-capH])
			plate();
	}
  translate([-16.5+12,33,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5+12,25,16])cylinder(r=3.1, h=5, $fn=6);
  translate([-16.5-12,25,16])cylinder(r=3.1, h=5, $fn=6);
  translate([-16.5-12,33,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5-12,33,16])cylinder(r=3.15, h=5, $fn=6);
 	translate([-16.5+12,33,16])cylinder(r=3.15, h=5, $fn=6);
	}
}

plate();
// slightly smaller 'key' for actual use
//translate([-15,10,22])rotate([180,0,0])
//	conekey_fit();
//conekey();
// not using plate2x now
//plate2x();
// mold is just used by plate()
//translate([20,20,0])
//	mold();
// for evaluating printability
//ratcheteeth();	
//keymaster();
// conekey is cut-out from x-carriage
//translate([12,10,22])rotate([180,0,0])
//conekey();


 	

