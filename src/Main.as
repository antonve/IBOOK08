package {

import be.devine.cp3.ibook.Application;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Screen;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.geom.Rectangle;
import flash.utils.getDefinitionByName;

import net.hires.debug.Stats;

import starling.core.Starling;
[SWF (frameRate="60")]
public class Main extends MovieClip {

    // -- Properties -- //
    private var _starling:Starling;

    // -- Constructor -- //

    public function Main()
    {
        trace('[Main] CONSTRUCT');

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Size of application:
        stage.nativeWindow.bounds = new Rectangle(
                Screen.mainScreen.bounds.width - 1024 / 2,
                Screen.mainScreen.bounds.height - 768 / 2,
                1024,
                768
        );

        _starling = new Starling(Application, stage);
        _starling.start();

        addChild(new Stats());
    }

    // -- Methods -- //


    // -- Getters & Setters -- //

}
}
