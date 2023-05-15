                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:3075868
Adjustable Super Clamp by 247generator is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

This is an offshoot of my beefy 30mm glass clamp:
https://www.thingiverse.com/thing:3072415

I will be playing with the OpenSCAD file over here in an attempt to make it even more customizable!

I tried to break the red clamp by cranking it down to the kitchen counter as hard as I could and then pulling on the drawers it was blocking (see photos).  It flexed a lot when being clamped and showed some stress on an inside corner but it seemed very strong and it didn't feel like it was going to give way.  The clamp returned to it's normal shape and did not warp from being under that much pressure.  I will try printing clamps with less thickness and run the same test to see how much difference it really makes.

The original inspiration for making these stronger clamps was the popular "G-Clamp fully printable" that was quite easy to make fail when cranked down - deformation and bolt breakage.

For extra strength in practical use, print the screw part with 100% infill since there are some weak points, like where the ball connects.  Adding STL files to make that easy to do.

# Updates

## Initial Release

3.1 - Exposed more customization options to fiddle with, but something is still buggy when thickness is over 18mm


## September 13 2018

3.2 - Corrected the thickness bug, it now keeps a complete threaded hole (tested working from 5mm to 50mm) and reduced the default knurling fineness (complexity) to 500 so it's got a fighting chance of rendering the web browser preview.  Lower this number to what you want it to be just before creating the STL. If your browser won't render the preview of all the parts at once, you can turn off the visibility of all but one of the parts at a time to adjust them until the final create rendering action where they should all be visible but not assembled.

## September 16 2018

Added STL files that separate the main clamp part from the bolt and press of the larger clamps so that it's easy to print them with different infill settings, although what is better is to just increase the shell wall thickness to solidify the smaller bits and strengthen the clamp more efficiently than infill.

## October 6 2018

3.3 Learned a bit more about OpenSCAD, so I've got a slightly better understanding of what is going on in this code.  Fixed everything that was causing warnings.  Discovered that the main thing causing long rendering times is the rounded edges.  Changing the default from 2 to 0 changed local rendering from 32 seconds to 2 seconds with knurled finish set to 200, so that should make the larger sizes work much better in the Customizer.  I've also added a slider to adjust how round the rounded edges are so the appearance can be adjusted a little more.

## November 4 2018

3.3.1 Found the bug I introduced in the last update that would cause the press not to render if rounded edges was turned on.  It should now function as expected if you want to re-do those clamps that failed.

I have a strange issue - I've updated OpenSCAD so I can use the customizer locally but I cannot do a preview of the clamp, only a full render works.  It may be the version has a bug because it's a development snapshot, but there might be something else that is dragging performance down in preview...

## November 30 2018

3.4.6 Made an asymmetric version https://www.thingiverse.com/thing:3247690 and fixed a few outstanding bugs I had meant to get to, so they are all now back-ported to update this version.

Another huge improvement to customizer reliability was made by UPDATING the screw library, which had bugs - seems to have cleared up the problems with previewing and sped up rendering times too.  I switched from rounding = 0 to the roundness being 4, which gives the same dimensions as a more rounded version while still rendering fast because it is close to square.  The default view has been updated to let you see all 3 components.

Dec. 1 - 3.4.7 popped one more feature over from the asymmetric version - a square inside corner option for the side where something would be clamped.  Not as strong, but you can now generate a G clamp like the one that inspired this project if you need that.

## December 3 2018

3.4.8 Found another longstanding mystery issue... the lack of countersinking in the threads of the base.  I've added that now, so there shouldn't be any binding from the edges when the screw exits the hole.