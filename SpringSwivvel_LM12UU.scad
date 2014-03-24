StS = 20.4;				// width between holder strips
LMsW = 1.22;				// width of holder strip
LMD = 21.4; 				// outside diameter 
LMsD = 20.4	;				// strip diameter
LMtotalW=30.2;				// width(measured)
LMossW = 3.6;				// width outside the holder strips, incl bevel
placeX = -16;				// Linear Bearing centerline
placeY = -1; 

SparePos = [-3.0,0,9]; // hole running paralell to bearing travel
Zpw = 4.85;			// zip tie width

module swiv12(){
translate([0,0,7]) rotate(a=[0,270,0])  difference() {
union() {

translate([13.5,8,15]) rotate(a=[0,0,0]) cube([17,8,8], center=true);
translate([13.5,8,0]) rotate(a=[0,0,0]) cube([17,8,8], center=true);

translate([-3,0,-3.5]) rotate(a=[0,0,0]) cube(size=[18,24,45], center = true);
translate([-20.5,0,-4.5]) rotate(a=[0,0,0]) cube(size=[29,24,47], center = true);
translate([10.5,0,-2.5]) rotate(a=[0,0,0]) cube(size=[9,24,41], center = true);
translate([11,0,-20]) rotate(a=[0,0,90]) cylinder(h = 39, r=12, $fn=100, center=false);

translate([-3,9,-19]) rotate(a=[90,90,0]) cylinder(h = 18, r=9, $fn=64, center=false);
/*translate([6,22.92/2+4.8,-5.125]) rotate(a=[90,90,0]) cylinder(h = 4.8, r=6.25, $fn=6, center=false);*/
		} /****end positive stuff****/

/****begin take-away part of difference()  ****/

// alubar cutout
translate([-25,0,-22]) rotate(a=[90,270,0]) {  

	translate([(13.6-1.85)/2,0,0]) cube(size=[1.9,12.9,100], center = true);
	translate([-(13.6-1.85)/2,0,0]) cube(size=[1.9,12.9,100], center = true);
	translate([0,6.315,0]) cube(size=[13.7,1.95,100], center = true); 
									}
// rings for zip ties
difference() {
translate([placeY-.5,-8.5,placeX+.5]) rotate(a=[90,90,0]) 
	cylinder(h = Zpw, r=30/2, $fn=128, center=true);
translate([placeY-.5,-8.5,placeX+.5]) rotate(a=[90,90,0]) 
	cylinder(h = Zpw, r=24.5/2, $fn=128, center=true);}
difference() {
translate([placeY-.5,8.5,placeX+.5]) rotate(a=[90,90,0]) 
	cylinder(h = Zpw, r=30/2, $fn=128, center=true);
translate([placeY-.5,8.5,placeX+.5]) rotate(a=[90,90,0]) 
	cylinder(h = Zpw, r=24.5/2, $fn=128, center=true);}

// pretty curve
difference() {
translate([16,0,-30]) rotate(a=[90,90,0]) cylinder(h = 28, r=75, $fn=128, center=true);
translate([16,0,-30]) rotate(a=[90,90,0]) cylinder(h = 28, r=57, $fn=128, center=true);}

//spare hole
translate(SparePos) rotate(a=[90,90,0]) 
	cylinder(h = 26, r=4.05, $fn=64, center=true);
//translate(SparePos) rotate(a=[90,90,0]) 
//	cylinder(h = 26, r=11, $fn=64, center=true);
hull(){
translate(SparePos) rotate(a=[90,90,0]) 
	cylinder(h =7.2, r=(14.23+.3)/2, $fn=6, center=true);
translate(SparePos+[0,0,10]) rotate(a=[90,90,0]) 
	cylinder(h =7.2, r=(14.23+.3)/2, $fn=6, center=true);
}

// smaller spare hole
translate(SparePos+[-14,-0,-9]) rotate(a=[90,90,0]) 
	cylinder(h = 26, r=3.4, $fn=24, center=true);
translate(SparePos+[-14,-12+(5.55/2),-9]) rotate(a=[90,90,0]) 
	cylinder(h = 5.56, r=12.67/2, $fn=6, center=true);

// all measures include 'fudge' factor so don't just add them together

/*LM12UU */
translate([placeY,0,placeX]) rotate(a=[90,90,0]) 
	cylinder(h = StS, r=LMD/2, $fn=64, center=true);
translate([placeY,(StS/2)+(LMsW/2),placeX]) rotate(a=[90,90,0]) 
	cylinder(h = LMsW, r=LMsD/2, $fn=64, center=true);
translate([placeY,-(StS/2)-(LMsW/2),placeX]) rotate(a=[90,90,0])
	cylinder(h = LMsW, r=LMsD/2, $fn=64, center=true);
translate([placeY,(StS/2)+(LMsW/2)+(LMossW/2),placeX]) rotate(a=[90,90,0]) 
	cylinder(h = LMossW, r=LMD/2, $fn=64, center=true);
translate([placeY,-(StS/2)-(LMsW/2)-(LMossW/2),placeX]) rotate(a=[90,90,0])
	cylinder(h = LMossW, r=LMD/2, $fn=64, center=true);
// outside bearing cuts
translate([2,0,-28]) rotate(a=[90,90,0]) cube(size=[10,16,40], center = true);
translate([12,0,-21]) rotate(a=[90,90,0]) cube(size=[7,20,40], center = true);
translate([19,0,-19.5]) rotate(a=[90,90,0]) cube(size=[8,16,40], center = true);
translate([22,0,-19]) rotate(a=[90,90,0]) cylinder(h = 30, r=15, $fn=64, center=true);

// captured nut lag bolt
translate([16,0,-19]) rotate(a=[0,0,0]) cylinder(h =50, r=4.175, $fn=64, center=false);
translate([16,0,-12]) rotate(a=[0,0,0]) cylinder(h =7.2, r=7.6, $fn=6, center=false);
translate([20,0,-12]) rotate(a=[0,0,0]) cylinder(h =7.2, r=7.6, $fn=6, center=false);

/* old attach point
translate([-38,0,7]) rotate(a=[0,90,0]) cylinder(h =40, r=3.25, $fn=64, center=false);
translate([-0,0,7]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.5, $fn=6, center=true);
translate([-0,0,12]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.5, $fn=6, center=true);
translate([-0,0,17]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.5, $fn=6, center=true);
*/

// linear bearing snugger, with captive nut
translate([-40,0,-22]) rotate(a=[0,90,0]) cylinder(h =25, r=3.3, $fn=64, center=false);
translate([-15,0,-22]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.6, $fn=6, center=true);
translate([-15,0,-27]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.6, $fn=6, center=true);
translate([-15,0,-32]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.6, $fn=6, center=true);
translate([-15,0,-36]) rotate(a=[0,90,0]) cylinder(h =5.9, r=6.6, $fn=6, center=true);
// top to bottom stabilizer
translate([-25,0,-19]) rotate(a=[0,0,0]) cylinder(h =100, r=3.3, $fn=64, center=true);
translate([-25,0,4]) rotate(a=[0,0,0]) cylinder(h =6, r=6.6, $fn=6, center=false);
//translate([20,0,-12]) rotate(a=[0,0,0]) cylinder(h =5.2, r=7.4, $fn=6, center=false);


/*translate([0,0,5.5]) rotate(a=[0,0,0]) cylinder(h = 4.8, r=6.25, $fn=6, center=true);
translate([5,0,5.5]) rotate(a=[0,0,0]) cylinder(h = 4.8, r=6.25, $fn=6, center=true);
translate([0,0,14.2]) rotate(a=[0,0,90]) cylinder(h = 22, r=6.25, $fn=6, center=false);*/
/* translate([0,0,95/2-3.54]) cylinder(h = 3.545, r=6.3, $fn=6, center=false);*/
/*translate([0,0,-92.5/2-3.545]) cylinder(h = 3.545, r=6.3, $fn=6, center=false); */

// m3 holes & nut-traps
translate([13.5,8,0]) rotate(a=[0,90,0]) cylinder(r=1.63, h=17.1, center=true);
translate([13.5,8,15]) rotate(a=[0,90,0]) cylinder(r=1.63, h=17.1, center=true);
hull(){
translate([11,8,0]) rotate(a=[0,90,0]) cylinder(r=6.47/2, h=2.55, center=true);
translate([11,16,0]) rotate(a=[0,90,0]) cylinder(r=6.47/2, h=2.55, center=true);
}
hull(){
translate([11,8,15]) rotate(a=[0,90,0]) cylinder(r=6.47/2, h=2.55, center=true);
translate([11,16,15]) rotate(a=[0,90,0]) cylinder(r=6.47/2, h=2.55, center=true);
}
 } /* end take-away */
// support blocks on round
difference(){
union(){
// support blocks on round

// big captured nut insert printing supports
translate([-15.5,0,1.2]) rotate(a=[0,90,0]) cube([.5,10,7], center=true);
translate([-15.5,0,6.8]) rotate(a=[0,90,0]) cube([.5,10,7], center=true);
translate([-9,4.25,4]) rotate(a=[90,90,90]) cube([.5,15.5,10], center=true);
}
}
} // end swiv12
translate([0,0,LMtotalW/2-3]) rotate([-90,0,0])
	swiv12();