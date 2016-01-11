# HaxeFlixel Analog Gamepad Polar Coordinate Tank Movement

Move a simple shape around using polar coordinates with analog gamepad controls in tank style

A great starting point for game projects and game jams.

See our other [HaxeFlixel Code Samples](https://github.com/GomaGames?query=HaxeFlixel)

See all of our [GameDev resources](http://gomagames.github.io/)

----

## Move an Nested Sprite around using Polar Coordinate Movement with a gamepad like a tank

This is best for `tank` style movement, like a top down tank shooter.

If you want even `x` **and** `y` angular movement, like a top down adventure game or a free moving space shooter (Geometry Wars style) then see this Proof of concept instead [HaxeFlixel-Analog-Gamepad-Polar-Coordinate-Movement](https://github.com/GomaGames/HaxeFlixel-Analog-Gamepad-Polar-Coordinate-Movement)

This demo autodetects your connected usb gamepad.
This project uses a usb Logitech gamepad, though other gamepads can be used if you [ modify the code ](/source/PlayState.hx) a little, check the docs for compatible configurations:

- [HaxeFlixel Gamepad guide](http://haxeflixel.com/documentation/gamepads/)
- [Logitech Gamepad Configuration](https://github.com/HaxeFlixel/flixel/blob/master/flixel/input/gamepad/LogitechButtonID.hx)
- [XBOX Gamepad Configuration](https://github.com/HaxeFlixel/flixel/blob/master/flixel/input/gamepad/XboxButtonID.hx)
- [PS3 Gamepad Configuration](https://github.com/HaxeFlixel/flixel/blob/master/flixel/input/gamepad/PS3ButtonID.hx)
- [PS4 Gamepad Configuration](https://github.com/HaxeFlixel/flixel/blob/master/flixel/input/gamepad/PS4ButtonID.hx)
- [OUYA Gamepad Configuration](https://github.com/HaxeFlixel/flixel/blob/master/flixel/input/gamepad/OUYAButtonID.hx)


![movement](/doc/movement.gif)

_notice how the turret "sticks" to the tank base when the base rotates_


Plug in a usb gamepad.
Test this proof of concept.

Controls :

- Left Analog Control Stick
  - `x` axis - rotate the tank base
  - `y` axis
    - `up` to move forward
    - `down`  to move in reverse (reverse has slower move speed)
- Right Analog Control Stick `x` axis - rotate the turret

Gamepads used :

Aftermarket usb gamepad, [walmart link](http://www.walmart.com/ip/POWER-A-PS3-ProEX-Wired-Controller-Black-PS3-Playstation-3/14962336), [newegg link](http://www.newegg.com/Product/Product.aspx?Item=N82E16879815015)

![USB Gampad](http://i5.walmartimages.com/dfw/dce07b8c-f05b/k2-_8c4a253a-abcf-474d-bf5c-f2c4725ce7f3.v1.jpg)

Logitech F310 usb gamepad - [newegg link](http://www.newegg.com/Product/Product.aspx?Item=N82E16826104402)

![Logitech Gamepad](http://gaming.logitech.com/assets/47832/f310-gaming-gamepad-images.png)

_on the back of this gamepad, there is a switch setting for `x` and `d`, set it to `d` if it's not detected (osx)_

----

## To run this proof of concept

### Setup
_only need to do this once_

[ Install OpenFL and Haxe ](http://www.openfl.org/documentation/setup/)
[ Install HaxeFlixel ](http://haxeflixel.com/documentation/install-haxeflixel)

#### Sublime Text users, get the Haxe Plugin

##### Get Sublime Text Package Control
https://packagecontrol.io/installation

`ctrl + shift + p` to open the Sublime Text command palette

![Command Palette](http://i.imgur.com/UlD29KO.png)

````
package install
````
"Haxe"


#### Atom users, get the Haxe Plugin

`ctrl + shift + p` to open the Atom command palette

![Command Palette](http://i.imgur.com/hwEtnnf.png)

````
install package
````
"Settings View: Install Packages and Themes"

Perform a search for [**Haxe**](https://atom.io/packages/haxe) and install the package.

Also install dependent packages:

- [ **linter** ](https://atom.io/packages/linter)
- [ **language-haxe** ](https://atom.io/packages/language-haxe)
- [ **autocomplete-plus** ](https://atom.io/packages/autocomplete-plus)

Then search for [**lime**](https://atom.io/packages/lime) and install this package too.


#### Other Haxe Editors

Vim users, get [**vaxe**](https://github.com/jdonaldson/vaxe)

[More editors an IDEs](http://haxe.org/documentation/introduction/editors-and-ides.html)

----

## Testing

#### Run With Sublime Text Plugin

open this project in Sublime Text

open the `Main.hx` file

Choose compile target using `ctrl + shift + b`

![compile target](http://i.imgur.com/8wFfZSe.png)

Test the project using the chosen target `ctrl + enter`

#### Run With Atom

open project with Atom

in the project drawer, right-click on `project.xml` and `Set as active Lime/OpenFL file`

![Set as active Lime/OpenFL file](http://i.imgur.com/DQubtrW.png)

open the command palette with `ctrl + shift + b` and select `Lime: set target`

![Set lime target](http://i.imgur.com/iA8M2zP.png)

set current build target to **neko** (or your desired target)

`command + b` or `control + b` to build and test for the selected target


#### Run With Command Line

````
lime test neko
````
