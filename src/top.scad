thickness=1.6;
radius=3.5;
drill=2;
height=49;
width=58;
depth=thickness+8;
countersink = true;
$fn = 64; //number of faces on a circle

difference()
{
    union()
    {
        //create walls
        difference()
        {
            union()
            {
            translate([-radius,0,0])
                cube([width+2*radius,height,depth]);
            translate([0,-radius,0])
                cube([width,height+2*radius,depth]);
            }
            translate([-radius+thickness,-radius+thickness,thickness+3])	//3mm filler on "top"
                cube([width+2*(radius-thickness),height+2*(radius-thickness),depth]);
        }
        
        //add the mounting brackets
        cylinder(depth,radius,radius);
        translate([0,height,0])
            cylinder(depth,radius,radius);
        translate([width,height,0])
            cylinder(depth,radius,radius);
        translate([width,0,0])
            cylinder(depth,radius,radius);
    }

    //drill holes
    cylinder(depth,drill,drill);
    translate([0,height,0])
        cylinder(depth,drill,drill);
    translate([width,height,0])
        cylinder(depth,drill,drill);
    translate([width,0,0])
        cylinder(depth,drill,drill);
    
    //countersink
    if(countersink==true)
    {
        cylinder(drill,drill*2,drill);
        translate([0,height,0])
            cylinder(drill,drill*2,drill);
        translate([width,height,0])
            cylinder(drill,drill*2,drill);
        translate([width,0,0])
            cylinder(drill,drill*2,drill);
    }    
    
    //add slot for usb port
    translate([-radius,24-radius,depth-8])
        cube([12,15,8]);
    
    //add slot for audio jack
    translate([7-radius,-radius,depth-7])
        cube([9,13,7]);
    
    //add slot for camera header
    translate([17-radius,-radius,depth-6])
        cube([5,23,6]);
    
    //add slot for hdmi
    translate([24.5-radius,-radius,depth-7])
        cube([16,11,7]);
    
    //add slot for usb power
    translate([49-radius,-radius,depth-3])
        cube([10,6,3]);
    
    //add slot for status leds
    translate([width+radius-2,43-radius,depth-1])
        cube([2,7,1]);
        
    //add slot for connector
    translate([6.5-radius,49-radius,0])
        cube([52,7,depth]);

	//add slot for display header
    translate([width+radius-6,-radius+16,depth-7])
        cube([5,24,7]);
    
}