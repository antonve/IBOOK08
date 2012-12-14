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
[SWF (width='1024',height='768',frameRate="60")]
public class Main extends MovieClip {

    // -- Properties -- //
    private var _starling:Starling;

    // -- Constructor -- //

    public function Main()
    {
        trace('[Main] App init');

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Size of application:
        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - stage.nativeWindow.width) / 2;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - stage.nativeWindow.height) / 2;

        _starling = new Starling(Application, stage);
        _starling.start();

        var stats:Stats = new Stats();
        addChild(stats);
        stats.x = stage.stageWidth - (stats.width);
        stats.y = stage.stageHeight - (stats.height);
    }

    // -- Methods -- //


    // -- Getters & Setters -- //

}
}
