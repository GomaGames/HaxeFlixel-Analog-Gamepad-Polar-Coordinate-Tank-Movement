package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.display.FlxNestedSprite;
import sprites.Tank;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var tank:FlxNestedSprite;

  /**
   * Function that is called up when to state is created to set it up.
   */
  override public function create():Void
  {
    // Hide the mouse
    FlxG.mouse.visible = false;

    // create a new tank
    tank = new Tank();

    // position the tank
    tank.x = (FlxG.width - tank.width) / 2;
    tank.y = (FlxG.height - tank.height) / 2;

    // add the shape to this state
    add(tank);

    // call the superclass create() method *required*
    super.create();
  }

  /**
   * Function that is called when this state is destroyed - you might want to
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    // set sprites to null to help with gc
    tank = null;

    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {
    super.update();
  }

}
