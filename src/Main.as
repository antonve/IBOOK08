package {

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.utils.getDefinitionByName;

public class Main extends MovieClip {

    // -- Properties -- //

    private var app:DisplayObject;

    // -- Constructor -- //

    public function Main()
    {
        trace('[Main] CONTSRUCT');

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Preloader instellen:
        if(loaderInfo.bytesLoaded == loaderInfo.bytesTotal) {
            completeHandler(null);
        } else {
            loaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        }
    }

    // -- Methods -- //

    // Fabian (22/11) - Functie ivm Preloader */
    private function progressHandler(event:ProgressEvent):void
    {
        var p:Number = event.bytesLoaded / event.bytesTotal;
        // Progress in console weergeven:
        trace("[Main] Progress" + p);
    }

    // Fabian (22/11) - Functie ivm Preloader */
    private function completeHandler(event:Event):void
    {
        trace('[Main] Loading complete');
        showApplication();
    }

    // Fabian (22/11) - Functie ivm Preloader */
    private function showApplication():void
    {
        this.gotoAndStop(2);

        var appClass:* = getDefinitionByName("be.devine.cp3.ibook.Application");
        app = new appClass();
        addChild(app);
    }

    // -- Getters & Setters -- //

}
}
