package sprites;

import flixel.FlxG;
import flixel.addons.display.FlxNestedSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.LogitechButtonID;
import flixel.util.FlxVelocity;

class Tank extends FlxNestedSprite{

  // set the movement speed
  private static inline var forward_speed:Float = 5;
  private static inline var reverse_speed:Float = 1;

  // set the rotation speed of the base
  private static inline var pivot_speed:Float = 2;

  // set the rotation speed of the turret
  private static inline var turret_rotation_speed:Float = 2;

  /*
    The Image object for tank
   */
  private var turret:FlxNestedSprite;

  /*
    Store tank motion speeds
   */
  private var forward_velocity:Float;         // forward velocity
  private var base_angular_velocity:Float;    // tank's base rotation and direction
  private var turret_angular_velocity:Float;  // turret's rotation

  /*
    Store Player GamePad
   */
  private var game_pad:FlxGamepad;

  public function new()
  {
    // must call super constructor before loading graphic
    super();

    /*
      Initialize tank movement speed
     */
    forward_velocity = 0;
    base_angular_velocity = 0;
    turret_angular_velocity = 0;

    // path to base image asset
    loadGraphic("assets/images/tankBase.png");

    // create a nested sprite for turret
    turret = new FlxNestedSprite();
    turret.loadGraphic("assets/images/tankTurret.png");
    turret.relativeAngle = 180; // start facing "forward"
    this.add(turret);
  }

  override public function update():Void
  {
    handleInput();

    handleAnimation();

    super.update();
  }

  override public function destroy():Void
  {
    super.destroy();
  }

  /**
   * moves player
   */
  public inline function handleAnimation()
  {
    /*
      Move the shape
      http://api.haxeflixel.com/flixel/util/FlxVelocity.html#velocityFromAngle
     */
    var velocity = FlxVelocity.velocityFromAngle(this.angle - 90, forward_velocity);
    this.x += velocity.x;
    this.y += velocity.y;

    // update base rotation
    this.angle += base_angular_velocity;

    // turret rotation, also moves "with" the base through "relativeAngle" property
    turret.relativeAngle += turret_angular_velocity;
  }

  /**
   * Checks for gamepad input
   */
  private inline function handleInput()
  {
    // Important: can be null if there's no active gamepad yet!
    if (game_pad == null) {
      game_pad = FlxG.gamepads.lastActive;
    }else{
      updateGamepadMovement();
    }
  }

  private inline function updateGamepadMovement():Void
  {
    /*
      X Axis controls the Tank Base Direction (angle)
     */
    if ( game_pad.getAxis( LogitechButtonID.LEFT_ANALOGUE_X ) != 0 ){

      // move shape towards x axis
      base_angular_velocity = pivot_speed * game_pad.getXAxis( LogitechButtonID.LEFT_ANALOGUE_X ) ;

    }else{

      // stop moving horizontally
      base_angular_velocity *= .9; // set to = 0; to stop hard

    }

    /*
      Y Axis controls the Tank's forward and reverse movement
     */
    if ( game_pad.getAxis( LogitechButtonID.LEFT_ANALOGUE_Y ) != 0 ){

      // move shape towards negative y axis
      forward_velocity = (
        ( game_pad.getYAxis( LogitechButtonID.LEFT_ANALOGUE_Y ) < 0 )?
        forward_speed : reverse_speed
      ) * game_pad.getYAxis( LogitechButtonID.LEFT_ANALOGUE_Y );

    }else{

      // stop moving forward or backward
      forward_velocity *= .9; // set to = 0; to stop hard

    }


    /*
      Turret Rotation Control
     */
    if ( game_pad.getAxis( LogitechButtonID.RIGHT_ANALOGUE_X ) != 0 ){

      // rotate shape
      turret_angular_velocity = turret_rotation_speed * game_pad.getXAxis( LogitechButtonID.RIGHT_ANALOGUE_X );

    }else{

      // stop rotating
      turret_angular_velocity *= .9; // set to = 0; to stop hard

    }


    /*
      Test button presses
    */
    if (game_pad.pressed(LogitechButtonID.ONE)) {
      trace("The X button of the Logitech controller is pressed.");
    }

    if (game_pad.pressed(LogitechButtonID.TWO)) {
      trace("The A button of the Logitech controller is pressed.");
    }

    if (game_pad.pressed(LogitechButtonID.THREE)) {
      trace("The B button of the Logitech controller is pressed.");
    }

    if (game_pad.pressed(LogitechButtonID.FOUR)) {
      trace("The Y button of the Logitech controller is pressed.");
    }

  }
}
