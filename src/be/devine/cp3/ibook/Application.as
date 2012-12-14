package be.devine.cp3.ibook {

import be.devine.cp3.ibook.managers.PageManager;
import be.devine.cp3.ibook.services.PageService;
import be.devine.cp3.ibook.view.components.UI;
import be.devine.cp3.ibook.view.components.buttons.OverviewButton;

import flash.events.Event;

import starling.display.Sprite;
import starling.core.Starling;
import be.devine.cp3.ibook.model.AppModel;

public class Application extends Sprite {

    // -- Properties -- //

    private var appModel:AppModel;


    [Embed(source="/assets/fonts/Helvetica.ttf", embedAsCFF="false", fontFamily="Helvetica")]
    private static const Helvetica:Class;

    [Embed(source="/assets/fonts/HelveticaLight.ttf", embedAsCFF="false", fontFamily="Helvetica")]
    private static const HelveticaLight:Class;

    [Embed(source="/assets/fonts/HelveticaBold.ttf", embedAsCFF="false", fontFamily="Helvetica")]
    private static const HelveticaBold:Class;


    // -- Constructor -- //

    public function Application()
    {
        trace('[Application] CONSTRUCT');

        appModel = AppModel.getInstance();
        appModel.renderStage = this;

        var pageService:PageService = new PageService();
        pageService.loadPagesXML("assets/data.xml");

        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
    }

    // -- Methods -- //

    // -- Getters & Setters -- //


    // -- event handlers -- //
    private function pagesChangedHandler(event:Event):void
    {
        this.removeEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        PageManager.getInstance().renderPage(0);
        addChild(new UI());
    }
}
}
