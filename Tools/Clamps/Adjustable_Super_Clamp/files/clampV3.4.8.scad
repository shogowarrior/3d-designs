// clamp customizable akaJes 2016 (c)
// tweaked for increasing thickness not affecting other parts, renamed dimensions, adjustable knurled finish, made more adjustments available and updated screw library and fixed warnings created by it. - 247generator 2018


//include <polyScrewThread_r1.h>
//include <knurledFinishLib.h>

// preview[view:east]

/*[visibility]*/
//
show_clamp=1; //[0:No,1:Yes]
show_bolt=1; //[0:No,1:Yes]
show_press=1; //[0:No,1:Yes]
// do not create assembled for printing :)
show_assembled=1; //[0:No,1:Yes]
/*[clamp]*/
clamp_length=60;
clamp_width=35;
clamp_depth=60;
// minimum 5, do not exceed clamp length
clamp_thickness=15;
// round is stronger
corner_shape=0;//[0:Round,1:Square]
// radius of ball that makes round edges
rounding=2;
// how smoothly rounded or polygonal the rounding is (24 is plenty)
roundedness=8; //[4:4:64]
// adjusts how tight the threads mesh - don't change unless it's too sloppy or tight. (4.3% x 16mm is a 0.688mm gap)
bolt_hole_space_factor=4.3;
/*[bolt]*/
knob_length=15;
knob_diameter=24;
// a lower number makes finer points: 180 felt good, 250 is sharp but better grip, 400 previews quickly.
knob_knurled_finish=400;
screw_diameter=16;
// keeps the bolt from getting in the way but limits it to clamping objects bigger this amount
screw_length_reduction=0;
// shows the preview opened by this much:
assembled_screw_position=0;
/*[press]*/
press_diameter=24;
// 2 is zero thickness for press diameter: can help with clearance on shorter clamps with a wide enough screw.
press_thickness=5;//[2:5]
// 0.3mm fit snug and 0.6mm was too loose on my prints
ball_and_socket_clearance=0.3;

/*[hidden]*/
// resets the zoom every time, comment out or change as needed
//$vpd = 300;
radius=1.8; //rounded corners
diameter_ball=8; //and socket
screw_length=clamp_length+clamp_thickness-13-(rounding*4)-screw_length_reduction;
length=clamp_length-rounding*2;
width=clamp_width-rounding*2;
depth=clamp_depth-rounding*2;
thickness=clamp_thickness-rounding*2;
hole_shift=depth-min(clamp_width/2,depth/2);
screw_pos=assembled_screw_position;
knurled_finish=(knob_knurled_finish/100);

 if (show_assembled)rotate([0,0,-90]){
  base();
  translate([-knob_length-radius*thickness-rounding-screw_pos,hole_shift,clamp_width/2]){
    rotate([0,90,0])bolt();
    translate([knob_length+screw_length+5+8,0,0])rotate([0,-90,0])press();
  }
}else{
  if(show_clamp)
    base();
  if(show_press)
    translate([max(30,knob_diameter),depth+20,0])press();
  if(show_bolt)
    translate([0,depth+max(20,knob_diameter*0.75),0])bolt();
}

module corner(tr){
  intersection(){
    difference(){
        // outside corner
      cylinder(r=tr,h=width,$fn=64);
      translate([0,0,-.1])
        // inside corner
        cylinder(r=thickness*(radius-1),h=width+.2,$fn=32);
    }
    translate([-tr,-tr,0])cube([tr,tr,width]); 
  }
}


module s_corner(tr){
    ti=thickness*(radius-1);
  intersection(){
    difference(){
        // outside corner
      cylinder(r=tr,h=width,$fn=64);
      translate([0,0,-.1])
        // inside corner
        cylinder(r=thickness*(radius-1),h=width+.2,$fn=32);
        // square corner option
              translate([0,0*(-rounding-thickness/2),(width/2)-.1])
        cube([2*ti*corner_shape,2*ti*corner_shape,corner_shape*(width+.2)],center=true);
        
    }
    translate([-tr,-tr,0])cube([tr,tr,width]); 
  }
}

module acorner(tr){
    ti=thickness*(radius-1);
    echo (tr);
    echo (ti);
  intersection(){
    difference(){
        // outside corner
      cylinder(r=tr,h=width,$fn=64);
        // inside corner
      translate([0,-rounding-thickness/2,-.1])
        cylinder(r=thickness*(radius-1),h=width+.2,$fn=32);
        // remove the remaining inside corner for asym corner
        translate([-ti,(-ti/2)-rounding,0])cube([ti,ti,width]); 
    }
    translate([-tr,-tr,0])cube([tr,tr,width]); 
  }
}
module base(){
  translate([0,0,rounding])
    difference(){
    minkowski(){
        //union(){
      tr=thickness*radius;
      ti=thickness*(radius-1);
        union(){
            // top corner
        corner(tr);
            // top flat
        translate([-tr,0,0])cube([thickness,depth,width]);
            // side flat
        translate([0,-tr,0])cube([length-ti*2,thickness,width]);
            // bottom corner
        translate([length-ti*2,0,0])rotate([0,0,90])s_corner(tr);
            // bottom flat
        translate([length-ti,0,0])cube([thickness,depth,width]);
                }
      sphere(r=rounding,$fn=roundedness);
    }
    translate([0.1-clamp_thickness*0.8+rounding*2+(rounding*0.6),hole_shift,width/2])rotate([0,-90,0]) 
   {
       screw_thread(screw_diameter+((bolt_hole_space_factor/100)*screw_diameter),4,55,clamp_thickness+0.2,PI/2,2);
       translate ([0,0,0.2]) hex_countersink_ends(1.5,screw_diameter,55,2,clamp_thickness-0.2);
   }
  }
}
module bolt(){
    knurled_cyl(knob_length, knob_diameter, knurled_finish, knurled_finish, 1, 2, 10);
    translate([0,0,knob_length]) screw_thread(screw_diameter,4,55,screw_length,PI/2,2);
    translate([0,0,knob_length+screw_length])cylinder(h=6,d=6,$fn=30);
    translate([0,0,knob_length+screw_length+5])sphere(d=diameter_ball,$fn=32);
}
module rounded(h=5,d=20,r=2){
  translate([0,0,r])
    minkowski(){
      cylinder(d=d-r*2,h=h-r*2, $fn=64);
      sphere(r=r, $fn=roundedness);
    }
}
module press(){
    $fn=32;
    difference(){
      union(){
        rounded(h=press_thickness,d=press_diameter,r=1);
        rounded(h=10,d=14,r=1);
        }
      translate([0,0,10-2])sphere(d=diameter_ball+ball_and_socket_clearance);
      for (i=[0,120,240])
        translate([0,0,6.5])rotate([90,0,90+i])hull(){
          cylinder(d=3,h=10);
          translate([0,5,0])cylinder(d=3,h=10);
        }
    }
}






/*
 * knurledFinishLib.scad
 * 
 * Written by aubenc @ Thingiverse
 *
 * This script is licensed under the Public Domain license.
 *
 * http://www.thingiverse.com/thing:9095
 *
 * Usage:
 *
 *    knurled_cyl( Knurled cylinder height,
 *                 Knurled cylinder outer diameter,
 *                 Knurl polyhedron width,
 *                 Knurl polyhedron height,
 *                 Knurl polyhedron depth,
 *                 Cylinder ends smoothed height,
 *                 Knurled surface smoothing amount );
 */
module knurled_cyl(chg, cod, cwd, csh, cdp, fsh, smt)
{
    cord=(cod+cdp+cdp*smt/100)/2;
    cird=cord-cdp;
    cfn=round(2*cird*PI/cwd);
    clf=360/cfn;
    crn=ceil(chg/csh);

    intersection()
    {
        shape(fsh, cird, cord-cdp*smt/100, cfn*4, chg);

        translate([0,0,-(crn*csh-chg)/2])
          knurled_finish(cord, cird, clf, csh, cfn, crn);
    }
}

module shape(hsh, ird, ord, fn4, hg)
{
        union()
        {
            cylinder(h=hsh, r1=ird, r2=ord, $fn=fn4, center=false);

            translate([0,0,hsh-0.002])
              cylinder(h=hg-2*hsh+0.004, r=ord, $fn=fn4, center=false);

            translate([0,0,hg-hsh])
              cylinder(h=hsh, r1=ord, r2=ird, $fn=fn4, center=false);
        }

}

module knurled_finish(ord, ird, lf, sh, fn, rn)
{
    for(j=[0:rn-1])
    { 
    h0=sh*j;
    h1=sh*(j+1/2);
    h2=sh*(j+1);
        for(i=[0:fn-1])
        {
            lf0=lf*i;
            lf1=lf*(i+1/2);
            lf2=lf*(i+1);
            polyhedron(
                points=[
                     [ 0,0,h0],
                     [ ord*cos(lf0), ord*sin(lf0), h0],
                     [ ird*cos(lf1), ird*sin(lf1), h0],
                     [ ord*cos(lf2), ord*sin(lf2), h0],

                     [ ird*cos(lf0), ird*sin(lf0), h1],
                     [ ord*cos(lf1), ord*sin(lf1), h1],
                     [ ird*cos(lf2), ird*sin(lf2), h1],

                     [ 0,0,h2],
                     [ ord*cos(lf0), ord*sin(lf0), h2],
                     [ ird*cos(lf1), ird*sin(lf1), h2],
                     [ ord*cos(lf2), ord*sin(lf2), h2]
                    ],
                faces=[
                     [0,1,2],[2,3,0],
                     [1,0,4],[4,0,7],[7,8,4],
                     [8,7,9],[10,9,7],
                     [10,7,6],[6,7,0],[3,6,0],
                     [2,1,4],[3,2,6],[10,6,9],[8,9,4],
                     [4,5,2],[2,5,6],[6,5,9],[9,5,4]
                    ],
                convexity=5);
         }
    }
}




/*
 *    polyScrewThread_r1.scad    by aubenc @ Thingiverse
 *
 * This script contains the library modules that can be used to generate
 * threaded rods, screws and nuts.
 *
 * http://www.thingiverse.com/thing:8796
 *
 * CC Public Domain
 */

module screw_thread(od,st,lf0,lt,rs,cs)
{
    or=od/2;
    ir=or-st/2*cos(lf0)/sin(lf0);
    pf=2*PI*or;
    sn=floor(pf/rs);
    lfxy=360/sn;
    ttn=round(lt/st+1)+1;
    zt=st/sn;

    intersection()
    {
        if (cs >= -1)
        {
           thread_shape(cs,lt,or,ir,sn,st);
        }

        full_thread(ttn,st,sn,zt,lfxy,or,ir);
    }
}

module hex_nut(df,hg,sth,clf,cod,crs)
{

    difference()
    {
        hex_head(hg,df);

        hex_countersink_ends(sth/2,cod,clf,crs,hg);

        screw_thread(cod,sth,clf,hg,crs,-2);
    }
}


module hex_screw(od,st,lf0,lt,rs,cs,df,hg,ntl,ntd)
{
    ntr=od/2-(st/2)*cos(lf0)/sin(lf0);

    union()
    {
        hex_head(hg,df);

        translate([0,0,hg])
        if ( ntl == 0 )
        {
            cylinder(h=0.01, r=ntr, center=true);
        }
        else
        {
            if ( ntd == -1 )
            {
                cylinder(h=ntl+0.01, r=ntr, $fn=floor(od*PI/rs), center=false);
            }
            else if ( ntd == 0 )
            {
                union()
                {
                    cylinder(h=ntl-st/2,
                             r=od/2, $fn=floor(od*PI/rs), center=false);

                    translate([0,0,ntl-st/2])
                    cylinder(h=st/2,
                             r1=od/2, r2=ntr, 
                             $fn=floor(od*PI/rs), center=false);
                }
            }
            else
            {
                cylinder(h=ntl, r=ntd/2, $fn=ntd*PI/rs, center=false);
            }
        }

        translate([0,0,ntl+hg]) screw_thread(od,st,lf0,lt,rs,cs);
    }
}

module hex_screw_0(od,st,lf0,lt,rs,cs,df,hg,ntl,ntd)
{
    ntr=od/2-(st/2)*cos(lf0)/sin(lf0);

    union()
    {
        hex_head_0(hg,df);

        translate([0,0,hg])
        if ( ntl == 0 )
        {
            cylinder(h=0.01, r=ntr, center=true);
        }
        else
        {
            if ( ntd == -1 )
            {
                cylinder(h=ntl+0.01, r=ntr, $fn=floor(od*PI/rs), center=false);
            }
            else if ( ntd == 0 )
            {
                union()
                {
                    cylinder(h=ntl-st/2,
                             r=od/2, $fn=floor(od*PI/rs), center=false);

                    translate([0,0,ntl-st/2])
                    cylinder(h=st/2,
                             r1=od/2, r2=ntr, 
                             $fn=floor(od*PI/rs), center=false);
                }
            }
            else
            {
                cylinder(h=ntl, r=ntd/2, $fn=ntd*PI/rs, center=false);
            }
        }

        translate([0,0,ntl+hg]) screw_thread(od,st,lf0,lt,rs,cs);
    }
}

module thread_shape(cs,lt,or,ir,sn,st)
{
    if ( cs == 0 )
    {
        cylinder(h=lt, r=or, $fn=sn, center=false);
    }
    else
    {
        union()
        {
            translate([0,0,st/2])
              cylinder(h=lt-st+0.005, r=or, $fn=sn, center=false);

            if ( cs == -1 || cs == 2 )
            {
                cylinder(h=st/2, r1=ir, r2=or, $fn=sn, center=false);
            }
            else
            {
                cylinder(h=st/2, r=or, $fn=sn, center=false);
            }

            translate([0,0,lt-st/2])
            if ( cs == 1 || cs == 2 )
            {
                  cylinder(h=st/2, r1=or, r2=ir, $fn=sn, center=false);
            }
            else
            {
                cylinder(h=st/2, r=or, $fn=sn, center=false);
            }
        }
    }
}

module full_thread(ttn,st,sn,zt,lfxy,or,ir)
{
  if(ir >= 0.2)
  {
    for(i=[0:ttn-1])
    {
        for(j=[0:sn-1])
        {
			 pt =  [	[0,                  0,                  i*st-st            ],
                        [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*st+j*zt-st       ],
                        [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*st+(j+1)*zt-st   ],
								[0,0,i*st],
                        [or*cos(j*lfxy),     or*sin(j*lfxy),     i*st+j*zt-st/2     ],
                        [or*cos((j+1)*lfxy), or*sin((j+1)*lfxy), i*st+(j+1)*zt-st/2 ],
                        [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*st+j*zt          ],
                        [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*st+(j+1)*zt      ],
                        [0,                  0,                  i*st+st            ]	] ;
        
            polyhedron(points=pt,
              		  faces=[	[1,0,3],[1,3,6],[6,3,8],[1,6,4],
											[0,1,2],[1,4,2],[2,4,5],[5,4,6],[5,6,7],[7,6,8],
											[7,8,3],[0,2,3],[3,2,7],[7,2,5]	]);
        }
    }
  }
  else
  {
    echo("Step Degrees too agresive, the thread will not be made!!");
    echo("Try to increase de value for the degrees and/or...");
    echo(" decrease the pitch value and/or...");
    echo(" increase the outer diameter value.");
  }
}

module hex_head(hg,df)
{
	rd0=df/2/sin(60);
	x0=0;	x1=df/2;	x2=x1+hg/2;
	y0=0;	y1=hg/2;	y2=hg;

	intersection()
	{
	   cylinder(h=hg, r=rd0, $fn=6, center=false);

		rotate_extrude(convexity=10, $fn=6*round(df*PI/6/0.5))
		polygon([ [x0,y0],[x1,y0],[x2,y1],[x1,y2],[x0,y2] ]);
	}
}

module hex_head_0(hg,df)
{
    cylinder(h=hg, r=df/2/sin(60), $fn=6, center=false);
}

module hex_countersink_ends(chg,cod,clf,crs,hg)
{
    translate([0,0,-0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2, 
             r2=cod/2-(chg+0.1)*cos(clf)/sin(clf),
             $fn=floor(cod*PI/crs), center=false);

    translate([0,0,hg-chg+0.1])
    cylinder(h=chg+0.01, 
             r1=cod/2-(chg+0.1)*cos(clf)/sin(clf),
             r2=cod/2, 
             $fn=floor(cod*PI/crs), center=false);
}

