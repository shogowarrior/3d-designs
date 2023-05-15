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


http://www.thingiverse.com/thing:2014187
Tevo Tarantula Single Motor Dual Z Axis by NinjaCookie is licensed under the Creative Commons - Attribution - Non-Commercial license.
http://creativecommons.org/licenses/by-nc/3.0/

# Summary

These parts are designed to give the Tevo Tarantula Dual Z axis from a single motor. I won't go into the pros and cons here, as it's complicated. No more motor couplers though, so makes things easier! It is a little more fiddly than dual motors, although requires no extra electronics.

They are remixed from the [excellent brackets](https://www.thingiverse.com/thing:1457449) by *thingirob*. I have remodeled these parts completely so they do look slightly different.**Please note I have added tolerances where the original parts had none, these should print fine without scaling**.

You need 2 of the Z Nut holders. I have included x2 in the name, but just to remind you.

Please note the photo I have included is v1. I have updated the designs since then to improve them based on my experiences.

###Additional Hardware
You will need the following parts to put it together. Many of the screws etc. were spares from the kit, or left over from other changes I have made for the printer.

* 900mm closed loop GT2 belt. I found a [seller on AliExpress](https://www.aliexpress.com/item/1pcs-3d-printer-belt-closed-loop-rubber-GT2-timing-belt-teeth-450-length-900mm-width-6mm/32731312386.html) that made these very cheaply. Link may disappear if they stop selling them.
* 4 x 608 Bearings
* 2 x 400mm lead screws. Threads need to match. Also need standard brass nuts.
* 2 x 8mm bore 20 tooth pulley. [Seller I used](https://www.aliexpress.com/item/3d-printer-pulley-aluminum-GT2-timing-pulley-20teeth-bore-8mm-2GT-synchronous-pulley-for-GT2-belt/32693377249.html)
* 5mm bore 20 tooth pulley for motor. [Seller I used](https://www.aliexpress.com/item/3d-printer-pulley-aluminum-GT2-timing-pulley-20teeth-bore-5mm-2GT-synchronous-pulley-for-GT2-belt/32693346346.html)
* 2 x Smooth Idler Pulleys w/ 16mm diameter. I had these so no seller, although commonly available. Basically same pulley used on other axes of Tarantula.
* 2 x 25mm M5 Screws. Can be longer.
* 2 x Nylon spaces or nuts.
* M5 washers (to use to space idlers correctly. I used 4).
* 2 x M5 nuts, ideally nylock nuts.
* Nema 17 motor from original Z axis.
* 4 x M3 screws to mount Motor (should already have these with original brackets).
* 8 x M3 screws and nuts to mount brass nuts.
* M4 T Nuts and screws. I won't include the amounts, however I would suggest using a minimum of 8 on each bracket, and 2 for each of the Nut holders. This would be 44 of each.
* **Optional** 2 x 8mm lock collars. The screws are held in place by gravity, however you can add lock collars underneath the upper bearing bracket. I do not use them, as in the event that the print head crashes into bed, the screws lift out of the bearings and prevent damage.

###Putting it together
####Brackets and Lead Screws
1. Put together the printer with the brackets as normal. Take care to try to align the brackets as best as possible.
2. Insert bearings into relevant spaces in brackets. Should fit well, although may need some sanding depending on how well your printer is set up.
3. Add brass nut to Z nut holders. Use M3 screws and nuts to securely fasten.
4. Attach 8mm bore pulleys to end of lead screws and tighten grub screws well.
5. Insert Lead screws through upper bearings, then thread on Z nuts, finally push lead screws into bottom bearings. If using 400mm screws, none of the screw will come out the other side, this bearing just supports it at each end.
6. Secure z nut holders to X axis. Care should be taken here to measure the distance from each side to a fixed point on the frame (top or bottom, not the bed), to ensure it is square. Use the lead screws to adjust up and down manually. It is easiest to have the T nuts in the slots properly, but leave them loose while adjusting, and tighten only at the end.

####Motor Mount
1. Attach stepper motor to motor mount. M3 screws should still be a little loose, letting the motor move along the slots.
2. Mount should then be attached to frame. Position as centrally as possible.
3. Add pulley to Motor and try to level with pulleys on lead screws. A straight edge like a ruler can be helpful here.
4. Push M5 screw through relevant hole for idler pulley. Add the nylon spacer (or nut if using instead), then add washers (2 for each). Finally put on the pulley and add final nylock nut.  These also need to be checked for height against the other pulleys. You may need to add or remove washers to get the heights right.
5. If the X axis is straight now, you can attach the belt. This should be threaded around the pulleys as show in the pictures. The last pulley can be a little tight due to limitations in the frame, but should go over without too much trouble.
6. Tension the belt by pulling the Motor back in it's slot then tightening the screws. Given how this works having really high tension is not as critical as it is on the other axes.
7. Manually rotate the motor pulley (with care!) to ensure the mechanism moves freely, and doesn't bind up.

####Firmware changes
You need to invert the Z motor direction in the firmware for this to work correctly. That is the only change you need to make (unless you have changed thread pitch at all).

###Important Notes
**It has been pointed out to me that unless alignment is perfect, having the screws supported on both end will lead to binding. I don't have a problem with this myself, however if you do, the best thing is to simply pop out the bottom bearings and not use them.**

As with any modification to a printer, make sure you test well, through the whole range of motion of the Z axis to ensure it moves freely and does not bind.

You may need to up the current to the Z motor slightly, as it is working a little harder than it was.

I needed to buy a longer Motor wire due to moving the Z axis. Depending how you mount your electronics, you may not need to do this.

###Feedback
I greatly appreciate any feedback you have! If you have an problems, I am happy to help where I can.

###Improvements from v1
* Removed some material to improve strength.
* Added ribs to upper brackets to improve strength.
* Fixed an alignment issue with some holes.
* Adjusted hole spacing under bearing blocks so all previous holes present.
* Increased travel for motor to allow more belt tension if required.

# Print Settings

Printer: Tevo Tarantula
Rafts: Doesn't Matter
Supports: Yes
Resolution: 0.2
Infill: 20%

Notes: 
Recommend Concentric supports for Top brackets as easier to remove. Z Nut holder does not require supports.

Unlike thingirob brackets, I have allowed tollerance in these parts where required, so should be able to print at 100% scaling.