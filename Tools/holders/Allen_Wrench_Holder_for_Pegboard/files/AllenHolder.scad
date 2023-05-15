// SAE -. 028",. 035",. 050", 1/16", 5/64", 3/32", 7/64", 1/8", 9/64", 5/32", 3/16", 7/32", 1/4", 5/16" and 3/8". Metric - 0. 7mm, 0. 9mm, 1. 3mm, 1. 5mm, 2. 0mm, 2. 5mm, 3. 0mm, 4. 0mm, 4. 5mm, 5. 0mm, 5. 5mm, 6. 0mm, 7. 0mm, 8. 0mm, 10. 0mm. 

use <base.scad>

width=4; //inches 

difference()
{
 base(width);
 toolarray();
}


module toolholeSAE(size)
{
   translate([0,-5,18])
    // for perfect hex holes: cylinder(d=size*1.25*25.4, h=80, center=true, $fn=6);
     cylinder(d=size*1.15*25.4, h=80, center=true, $fn=30);
}
module toolholeMetric(size)
{
   translate([0,-5,18])
    // for perfect hex holes: cylinder(d=size*1.25, h=80, center=true, $fn=6);
     cylinder(d=size*1.15, h=80, center=true, $fn=30);
}

module toolarray()
{
   // SAE
   translate([-40, 10, 0]) toolholeSAE(3/8); 
   translate([-27, 10, 0]) toolholeSAE(5/16); 
   translate([-16, 10, 0]) toolholeSAE(1/4); 
   translate([-7, 10, 0]) toolholeSAE(7/32); 
   translate([1, 10, 0]) toolholeSAE(3/16); 
   translate([8, 10, 0]) toolholeSAE(5/32); 
   translate([14, 10, 0]) toolholeSAE(9/64); 
   translate([19, 10, 0]) toolholeSAE(1/8); 
   translate([23.5, 10, 0]) toolholeSAE(7/64); 
   translate([28, 10, 0]) toolholeSAE(3/32); 
   translate([32, 10, 0]) toolholeSAE(5/64); 
   translate([35.5, 10, 0]) toolholeSAE(1/16); 
   translate([39, 10, 0]) toolholeSAE(.05); 
   //translate([38.5, 10, 0]) toolholeSAE(.035); 
   //translate([40, 10, 0]) toolholeSAE(.028);    
    
    // cutout
    translate([0,-12.5,17.5]) cube([(25.4*4), 20, 15], center=true);
   
   // Metric 
   translate([40, -5, 0]) toolholeMetric(10); 
   translate([27, -5, 0]) toolholeMetric(8); 
   translate([16, -5, 0]) toolholeMetric(7); 
   translate([7, -5, 0]) toolholeMetric(6); 
   translate([-1, -5, 0]) toolholeMetric(5.5); 
   translate([-9, -5, 0]) toolholeMetric(5); 
   translate([-16, -5, 0]) toolholeMetric(4.5); 
   translate([-22, -5, 0]) toolholeMetric(4);    
   translate([-27.5, -5, 0]) toolholeMetric(3); 
   translate([-32, -5, 0]) toolholeMetric(2.5); 
   translate([-36, -5, 0]) toolholeMetric(2); 
   translate([-39.5, -5, 0]) toolholeMetric(1.5); 
   //translate([-38.5, -5, 0]) toolholeMetric(1.3); 
   //translate([-40.5, -5, 0]) toolholeMetric(.9); 
   //translate([-42, -5, 0]) toolholeMetric(.7);  

}


