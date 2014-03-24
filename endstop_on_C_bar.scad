// attach things to base...

use <./Abar.scad>

cB=25;
tubeXY = 19.25;
swX = 20.5;
swY = 10.3;
swZ = 6.5;
wireThick = 3.1;
wireZ = 3.65;
wire1 = 1.11;
wire2 = 12.5;
wire3 = 19.5;
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
Ang = -120;

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
	translate([-tubeXY/2 - sur*2+.2, 0, -pH/2]) rotate([0,-90,0])
		cylinder(r1=tubeXY/2-3, r2=tubeXY/2+sur*4-3, h=sur*4+.1, center=true);
	translate([-tubeXY/2 - sur*2+.2, 0, pH/2]) rotate([0,-90,0])
		cylinder(r1=tubeXY/2-3, r2=tubeXY/2+sur*4-3, h=sur*4+.1,center=true);
		}
}

module plasticTube(cH=pH/2){
	minkowski(){
	cube([tubeXY+sur*3-3.2,tubeXY+sur, cH], center=true);
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
	difference(){
		union(){
		translate([-totalX/6-(pH/2*sin(-Ang)-3.7),-tubeXY/2-swY/2-.667,-pH/3]) rotate([90,0,12.7])
		switchbox();
	rotate([12.7,90-Ang,0])
		holderclip();
		}
	translate([-totalX/2,-tubeXY/2,-pH/3+posY-26.5]) rotate([0,0,12.7])
	cube([100,100,40],center=true);
	translate([-totalX/2,-tubeXY,+pH/3-posY+18.5]) rotate([0,0,12.7])
	cube([100,100,40], center=true);
	}
}

module holderBar(){
	difference(){
	plasticTube();
	translate([0,0,+11]) rotate([180,0,0])
		abar();
	}
}

module connectBar(){
	difference(){
		union(){
		translate([0,0,pH/2]) rotate([180,0,0])
		holderBar();
		translate([-swX/2-sur,+totalY+swY-3,pH/2]) rotate([90,0,0])
		switchbox();
		}
		translate([0,0,2]) rotate([0,0,0])
			cube([100,100,4.1], center=true);
		translate([0,0,pH-2]) rotate([0,0,0])
			cube([100,100,4.1], center=true);
		translate([5,0,0]) rotate([0,0,0])
			cylinder(r=3.35, h=80, center=true, $fn=24);
		translate([-5,0,0]) rotate([0,0,0])
			cylinder(r=1.7, h=80, center=true, $fn=24);
		translate([5,0,pH-5]) rotate([0,0,0])
			cylinder(r=6.52, h=5.5, center=true, $fn=6);
		translate([-5,0,pH-5]) rotate([0,0,0])
			cylinder(r=3.5, h=5.5, center=true, $fn=6);
		translate([0,0,pH/2-3.35/2]) rotate([0,90,0])
			cylinder(r=3.35, h=200, center=true, $fn=24);

	}
}
translate([0,0,pH-4]) rotate([0,180,0])
	connectBar();




