Printer-Parts
=============

Parts and set-up files for my own functioning 3D-printer design:

Why another 3D printer? Here are the reasons for this one:

1) utilize bargain priced salvaged nema-23 stepper motors, get higher torque/$ and 1/32 micro-steps.

nema-23 motors are mostly bigger, torque-ier, and consequently can draw more current than this job really requires - but they often have a better dollar-per-Newton ratio than the nema-17 motors one usually sees in 3D printers.  I have opportunistically purchased 25 or so for under $10 per and only had to pound the sintered cog-wheel off the shaft to obtain a great, cheap, 4-wire motor. The Pololu stepper drivers that utilize the Texas Instruments chip run cooler and allow 1/32 micro-stepping with a higher top current.  The only downside to that TI driver is a longer minimum pulse than the Allegro chip, but at 1.6 micro-seconds it has never been an issue, even with very small diameters.  Which brings me to the 2nd reason:

2) Get rid of belts and sprockets.

Printed sprockets and mismatched belts are the source of many errors and dreaded backlash.  I think everyone using belts eventually wants to use metal wheels that fit their printer design perfectly.  That cannot help but be another source of expense as we must search out particular diameters, tooth-designs, and shafting. Getting belt tension and return idler wheels to work perfectly without spending for the proper bearings and hardware is another headache we can do without.  The Delta-Bots have shown the wonders of Spectra fishing-line as a transmitter of force. However, I suspect the Delta-Bot works best as a prefab kit - and all the good ones use those carbon-fiber rods which I just don't have laying around. Delta is out. My local hardware store has hobby brass tube that can become 5 or 6 drive-spools for $3.  Idlers can be just about any bearing with some printed cones stuck on the outside to nudge the line on centre.  The headaches don't go away completely, but the diameters are small and the wheels are round. And you learn some fishing knots.

3) direct-drive extruder = fewer headaches, better filament retraction. 

I do eventually want to build a Delta-Bot - they look really neat.  But I suspect the Bowden-tube to the hot-end is not ideal unless filament and PTFE are well-matched and the PTFE is not bulged or worn anywhere along its length.  Also, that PTFE tube is another mail-order-only item.  Sure, I am throwing a lot more mass around by having the extruder motor on the X-carriage, but remember we have the Nema-23 torque and the 5/16 inch diameter drive spool to do the hurky-jerks we need on that mass.  Also, it is cheap and easy to switch between 3mm and 1.75mm filament with this set-up.  The filament drive is chosen to use a 608zz bearing and mk7+ gear, which I think is the best price-performance available.  Wade's + hobbed-bolts don't seem to be worth the extra headaches except to the Rep-Strap purist.

4) Benefit from Prusa-Mendel ubiquity, while avoiding some pitfalls.

This design owes a lot to the Prusa-I3 and Mendel lineage. I think it is naturally stiffer and depending on your skill-set, easier to build.  A low center of gravity and wide base reduce harmonic vibrations.  Y-axis drive is centrally located with no idler. Z-rods are moved off the stepper top-surface so they don't vibro-dance, instead forming a stiffer truss with the 1/4" Z-screw. Canted square-tubes dampen X-wobbles by compressing or tensioning horizontal rods instead of torqueing 90 degree joints.  More of this design is in imperial sizes available at your local North-American Home-Depot or Ace-Hardware.  It isn't as compact, because I like to be able to reach everything.  It isn't as pretty for the same reason.  Aluminium square tube and C-channel are cheaper and easier to cut than maker-beam / t-slot. The smooth-rod lengths are such that you may order 1 long rod, cut it in half (Dremmel, not hacksaw) for each pair.  Linear Bearings are cheap if you stick to LM8UU.  I do believe the LM12UU rod on the Y axis is worth the extra money, as it is acting structurally as well. You have multiple ways to trim and level this as you build. One long 5/16" threaded rod can be cut into all the needed sections, and 1/4" bolts & rod cover most everything else that isn't M3.  Using Sanguinolu as the brains, Marlin Firmware settings for Mendels or Ultimakers will get you most of the way there, just remember to compute the proper (likely much higher) steps - per - millimetre for each axis.  I am not sure why RAMPS 1.x + Arduino Mega2560 are more popular in year 2014 as that combo seems more expensive than Sanguinolu when I add it up - but this design should have no problem using RAMPS or some future ARM based solution which will surely be Prusa-Mendel compatible.
