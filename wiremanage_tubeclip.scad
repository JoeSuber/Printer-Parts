// attach things to base...

use </home/suber1/Things/Abar.scad>
//include </home/suber1/Things/Abar.scad>
cB=25;
tubeXY = 19.25;
swX = 20.5;
swY = 10.3;
swZ = 6.5;
wireThick = 3.1;
wireZ = 3.65;
wire1 = 1.11;
wire2 = 11.38;
wire3 = 18.5;
leverHinge = 3.4;
leverExtends = 19.35;
hole1X = 5.15;
hole2X = 14.67;
holeY = 2.78;
holeRad = 2.5/2;
sur = 1.56;
totalX = sur*2 + swX;
totalY = sur + swY;
totalZ = swZ + sur;
posX = totalX/2;
posY = totalY/2 + sur/2;
posZ = totalZ/2;
groove= 1.75;
pH = 30;
Ang = 12.7;

module switch(){
	cube([swX,swY,swZ], center=true);
	translate([0 ,-posY,-.1])
		cube([wire3, 3+2+.1, wireZ+.1], center=true);
}

module switchbox(){
	difference(){
		union(){
		translate([totalX/2,totalY/2,totalZ/2])
			cube([totalX,totalY-.1,totalZ], center=true);			
		}
		translate([posX,posY,posZ])
			switch();
	}
}

module aluTube(){
	cube([tubeXY,tubeXY, pH+.1], center=true);
	translate([tubeXY/2+.1, 0, 0])
		cylinder(r=groove, h=pH+.1, center=true, $fn=16);
	translate([tubeXY/2+.1, tubeXY/3, 0])
		cylinder(r=groove, h=pH+.1, center=true, $fn=16);
	translate([tubeXY/2+.1, -tubeXY/3, 0])
		cylinder(r=groove, h=pH+.1, center=true, $fn=16);
	hull(){
	translate([-tubeXY/2 - sur*2+.2, 0, -pH]) rotate([0,-90,0])
		cylinder(r1=tubeXY/2-2, r2=tubeXY/2+sur*4-2, h=sur*4+.1, center=true);
	translate([-tubeXY/2 - sur*2+.2, 0, pH]) rotate([0,-90,0])
		cylinder(r1=tubeXY/2-2, r2=tubeXY/2+sur*4-2, h=sur*4+.1,center=true);
		}
}

module plasticTube(cH=3){
	minkowski(){
	cube([tubeXY+sur*4,tubeXY+sur, cH], center=true);
	cylinder(r=1.2, h=cH, $fn=48, center=true);
	}

}

module holderclip(){
	difference(){
	plasticTube();
	aluTube();
	}
}

module placeBox(){
	translate([-totalX/2-(pH/2*sin(Ang)-sur-.2),tubeXY,0]) rotate([90,Ang,0])
		switchbox();
}
holderclip();
