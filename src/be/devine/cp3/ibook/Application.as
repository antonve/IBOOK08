package be.devine.cp3.ibook {

import be.devine.cp3.ibook.starling.ApplicationRender;

import flash.display.Sprite;
import starling.core.Starling;

public class Application extends Sprite {

    // -- Properties -- //
    private var _starling:Starling;

    // -- Constructor -- //

    public function Application()
    {
        _starling = new Starling(ApplicationRender, stage);
        _starling.start();
    }

    // -- Methods -- //

    // -- Getters & Setters -- //

}
}