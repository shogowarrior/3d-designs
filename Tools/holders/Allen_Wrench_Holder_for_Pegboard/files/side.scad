DIAMETER = 0.16*25.4;
OFFSET = 0.325*25.4; // from back of wall to center of vertical peg
VHEIGHT = 0.575*25.4;


translate([-30,-25,0]) bracket();
translate([-30,25,0]) bracket();
translate([30,-25,0]) bracket();
translate([30,25,0]) bracket();

module bracket()
{
 translate([0,0,DIAMETER/2])
  rotate([90,0,0])
   union()
   {   
    difference()
    {
     base();
     hole();
    }
    bottomPeg();
    smoothedTopPeg();
   }
}
module base()
{
    cube([30, DIAMETER, 40], center=true);
}

module hole()
{
    cube([16.5, DIAMETER+5, 10.5], center=true); 
}

module bottomPeg()
{
   translate([18.5,0,-25.4/2])
    rotate([0,90,0])
     cylinder(d=DIAMETER, h=8, center=true, $fn=25);    
}

module topPeg()
{ 
 difference()
 {   
  translate([18,0,25.4/2])
   rotate([0,-30,0]) 
    rotate([0,90,0])
     cylinder(d=DIAMETER, h=15, center=true, $fn=25);    
  cleave();
 }
 intersection()
 {
  translate([15+OFFSET,0,VHEIGHT/2+25.4/2])
   cylinder(d=DIAMETER, h=VHEIGHT, center=true, $fn=25);
  cleave();
 }
}

module cleave()
{
 translate([138,0,65])   
  rotate([0,-60,0])
   cube(200, center=true);  
}

module smoothedTopPeg()
{
 difference()
 {
  topPeg();
  translate([36,0,15])   
   rotate([0,30,0])
    cube(20, center=true); 
 }
}


    