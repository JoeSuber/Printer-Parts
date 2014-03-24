include <./bar_to_rod_join.scad>;


//translate([0,0,interior/2]) rotate([0,-90,0])
//barRod();
translate([18,0,interior/2]) rotate([0,-90,0])
barRod();
translate([-18,0,interior/2]) rotate([0,-90,0])
barRod(ang=12.7);