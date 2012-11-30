package be.devine.cp3.ibook {

import be.devine.cp3.ibook.model.AppModel;

import flash.display.Sprite;

public class Application extends Sprite {

    // -- Properties -- //

    private var appModel:AppModel;

    // -- Constructor -- //

    public function Application()
    {
        trace('[Application] CONSTRUCT');

        appModel = AppModel.getInstance();
        appModel.loadPagesXML();
    }

    // -- Methods -- //

    // -- Getters & Setters -- //

}
}
