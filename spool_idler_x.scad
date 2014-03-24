
// goal here is to press two halves togther around a bearing and let
// the line run directly on the bearing surface
// remember to allow a bit extra for washers on the outside
// of the bearing sandwich

// using m3 zinc washer and a leftover m3 bearing

bearing_rad=13.33/2; // measured 12.65
base_rad=bearing_rad*1.67;
bearing_width=4.31;
gap_width=9;
washerH=.5;
washerD=7.3; // measured 6.78

module bhalf(){
difference(){
cylinder(r1=base_rad, r2=bearing_rad, h=gap_width/2, center=true, $fn=64);
// bearing cut-out
translate([0,0,gap_width/2 - bearing_width/2])
	cylinder(r=bearing_rad, h=bearing_width, center=true, $fn=36);
// washer cut-out
translate([0,0,gap_width/2 - bearing_width - washerH/2])
	cylinder(r=washerD/2, h=washerH, center=true, $fn=36);
// m3 bolt hole
cylinder(r=1.61, h=gap_width, center=true, $fn=12);
}
}
translate([0,0,gap_width/4])
bhalf();
translate([base_rad*2+1,0,gap_width/4])
	bhalf();
