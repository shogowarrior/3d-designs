// Template for SoftBox for NeoPixel-LED-Ring
// by Jochen Krapf
// Version 1.02

// preview[view:south east, tilt:top diagonal]

/* [Global] */

// To render the parts choose the correcponding Part Name

Part = "Ring";   // [Ring:Complete Ring,Test:Test Single Segment]

// Parameters

// Count of LEDs of the ring
Segments = 24;

// PCB Ring Diameter at middle of LEDs in mm
RingLedDiameter = 59;

// PCB Ring Inner Mounting Diameter in mm
RingInnerDiameter = 52.0;

// PCB Ring Outer Mounting Diameter in mm
RingOuterDiameter = 65.7;

// Visible Inner Ring Diameter of SoftBox in mm
DisplayInnerDiameter = 45;

// Visible Outer Ring Diameter of SoftBox in mm
DisplayOuterDiameter = 90;

// Mounting Depth in mm
MountingDepth = 15;

// Wall Width in mm
WallWidth = 1;

// Diameter of a single LED in mm
LedDiameter = 5;

// Count of Mounting Domes
Mountings = 4;

// Use Printer Support
UsePrintSupport = 1;   // [0:No Print Support,1:Print Support Ring 1mm]


/* [Hidden] */

// Level of Details - Set to 0.1 for export to stl
//$fn = 24*4;
$fs = 0.5;

Wall = WallWidth;
SegmentAngle = 360/Segments;
SegmentAngle2 = SegmentAngle/2;
ScrewDiameter = 3;
mountingSteps = floor ( Segments / Mountings + 0.5 );


// Modules

module PrintSupport()
{
	difference()
	{
		// outer circle
		cylinder(d=RingLedDiameter+1, h=MountingDepth, $fn=90);

		// inner circle
		translate([0,0,-1])
			cylinder(d=RingLedDiameter-1, h=MountingDepth+2, $fn=90);
	}
}

module SegPlateTemplate(di, do, w)
{
	difference()
	{
		// outer circle
		cylinder(d=do, h=Wall, $fn=90);

		// inner circle
		translate([0,0,-1])
			cylinder(d=di, h=Wall+2, $fn=90);

		// cut to segment
		for ( r = [180+SegmentAngle2,-SegmentAngle2] )
			rotate([0,0,r])
				translate([w,-do,-1])
					cube([do*2,do*2,Wall+2]);
	}
}

module SegTemplate(di, do, w, l)
{
render()
	difference()
	{
		// make solid softbox
		hull()
		{
			// upper segment plate
			translate([0,0,MountingDepth-Wall])
				SegPlateTemplate(di, do, w);
		
			// lower led circle
			translate([0,RingLedDiameter/2,0])
				cylinder(d=l, h=Wall, $fn=24);
		}
	
		// reconstruct koncave inner circle (got lost by hull)
		translate([0,0,-0.01])
			cylinder(d1=RingLedDiameter-l, d2=di, h=MountingDepth-Wall+0.02, $fn=90);
		translate([0,0,MountingDepth-Wall-0.01])
			cylinder(d=di, h=Wall+0.02, $fn=90);
	}
}

module MountingTemplate()
{
	screw = ScrewDiameter*0.7;

	difference()
	{
		cylinder(d=5, h=MountingDepth);

		translate([-screw/2,-screw/2,-1])
			cube([screw,screw,MountingDepth+2]);
	}
}

module Ring()
{
	difference()
	{
		union()
		{
			// segments outside
			for ( r = [0:SegmentAngle:359] )
				rotate([0,0,r])
					SegTemplate(DisplayInnerDiameter-2*Wall,DisplayOuterDiameter+2*Wall,Wall/2, LedDiameter+2*Wall);
			
			// mounting domes
			if (Mountings>0)
				for ( r = [0:SegmentAngle*mountingSteps:359] )
					rotate([0,0,r])
					{
						if (RingInnerDiameter>0)
							translate([0,(RingInnerDiameter-ScrewDiameter)/2,0])
								MountingTemplate();
						if (RingOuterDiameter>0)
							translate([0,(RingOuterDiameter+ScrewDiameter)/2,0])
								MountingTemplate();
					}

			if (UsePrintSupport>0)
				PrintSupport();
		}
	
		// segments inside
		for ( r = [0:SegmentAngle:359] )
			rotate([0,0,r])
				translate([0,0,0.01])
					color( [1, 1, 1, 1] ) SegTemplate(DisplayInnerDiameter,DisplayOuterDiameter,-Wall/2, LedDiameter);

		// LEDs
		for ( r = [0:SegmentAngle:359] )
			rotate([0,0,r])
				translate([0,(RingLedDiameter)/2,-1])
					#cylinder(d=LedDiameter, h=1.02);
	}
}

module Test()
{
	difference()
	{
		union()
		{
			SegTemplate(DisplayInnerDiameter-Wall,DisplayOuterDiameter+Wall,Wall/2, LedDiameter+2*Wall);
			
			if (RingInnerDiameter>0)
				translate([0,(RingInnerDiameter-ScrewDiameter)/2,0])
					MountingTemplate();
			if (RingOuterDiameter>0)
				translate([0,(RingOuterDiameter+ScrewDiameter)/2,0])
					MountingTemplate();
		}
	
		translate([0,0,0.01])
			SegTemplate(DisplayInnerDiameter,DisplayOuterDiameter,-Wall/2, LedDiameter);

		translate([0,(RingLedDiameter)/2,-1])
			#cylinder(d=LedDiameter, h=1.02);
	}
}

//	color( [0.25, 0.5, 1, 0.25] )



// Use Modules

if (Part == "Ring")
{
	Ring();
}

if (Part == "Test")
{
	Test();	
}

echo("Outer Wall Angle [deg] =", atan ( ((DisplayOuterDiameter - RingLedDiameter - LedDiameter - 2*Wall) / 2) / (MountingDepth - Wall) ) );
echo("Inner Wall Angle [deg] =", atan ( -((DisplayInnerDiameter - RingLedDiameter + LedDiameter + 2*Wall) / 2) / (MountingDepth - Wall) ) );
