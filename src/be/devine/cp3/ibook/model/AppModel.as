package be.devine.cp3.ibook.model {

import be.devine.cp3.ibook.factories.PageVOFactory;
import be.devine.cp3.ibook.managers.PageManager;
import be.devine.cp3.ibook.vo.PageVO;

import cp3.requestQueue.RequestQueue;
import cp3.requestQueue.XMLTask;

import flash.desktop.NativeApplication;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.xml.XMLNode;

import starling.display.Sprite;

public class AppModel extends EventDispatcher {

    // -- Properties -- //

    public static const SELECTED_PAGE_CHANGED:String = "selectedPageChanged";
    public static const PAGES_CHANGED:String = "pagesChanged";

    private static var instance:AppModel;

    private var _selectedPageIndex:int;
    private var _pages:Vector.<PageVO>;

    private var _renderStage:Sprite;

    private var _queue:RequestQueue;
    private var _pageManager:PageManager;

    // -- Singleton -- //

    public function AppModel(e:Enforcer)
    {
        if (e == null) {
            throw new Error('AppModel is a singleton.');
        }
    }

    public static function getInstance()
    {
        if (instance == null) {
            instance = new AppModel(new Enforcer());
        }

        return instance;
    }


    // -- Methods -- //

    // Anton 13/12 //
    public function getPageById(id:uint):PageVO
    {
        if (id < this._pages.length) {
            return this._pages[id];
        }

        throw new Error('Page with id ' + id + ' doesn\'t exist.');
    }

    // -- Getters & Setters -- //

    // Fabian (23/11) - Getter imageIndex //
    public function get selectedPageIndex():int
    {
        return _selectedPageIndex;
    }

    // Fabian (23/11) - Setter imageIndex //
    public function set selectedPageIndex(value:int):void
    {
        if (_selectedPageIndex != value && value < _pages.length && value >= 0) {
            _selectedPageIndex = value;
            dispatchEvent(new Event(SELECTED_PAGE_CHANGED));
        }
    }

    // Fabian (23/11) - Getter pageUrls //
    public function get pages():Vector.<PageVO>
    {
        return _pages;
    }

    // Fabian (23/11) - Setter pageUrls //
    public function set pages(value:Vector.<PageVO>):void
    {
        if (_pages != value) {
            _pages = value;
            _selectedPageIndex = 0;
            dispatchEvent(new Event(PAGES_CHANGED));
        }
    }

    public function get renderStage():Sprite
    {
        return _renderStage;
    }

    public function set renderStage(value:Sprite):void
    {
        _renderStage = value;
    }

    public function get queue():RequestQueue
    {
        if (_queue == null) {
            _queue = new RequestQueue();
        }
        return _queue;
    }
}
}

internal class Enforcer{};