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

public class AppModel extends EventDispatcher {

    // -- Properties -- //

    public static const SELECTED_PAGE_CHANGED:String = "selectedPageChanged";
    public static const PAGES_CHANGED:String = "pagesChanged";

    private static var instance;

    private var _selectedPageIndex:int;
    private var _pages:Vector.<PageVO>;

    private var _queue:RequestQueue;
    private var _pageManager:PageManager;

    // -- Singleton -- //

    public function AppModel(e:Enforcer)
    {
        if (e == null) {
            throw new Error('AppModel is a singleton.');
        }

        _pageManager = new PageManager();
    }

    public static function getInstance()
    {
        if (instance == null) {
            instance = new AppModel(new Enforcer());
        }

        return instance;
    }


    // -- Methods -- //

    // Fabian (30/11) - Function Request Queue //
    // Anton (13/01 - Made path configurable, hardcoded paths are always a bad idea //
    public function loadPagesXML(path:String):void
    {
        _queue = new RequestQueue();

        // Load XML using Queue:
        var xmlTask:XMLTask = new XMLTask(path);
        xmlTask.addEventListener(Event.COMPLETE, xmlCompleteHandler);
        _queue.add(xmlTask);

        _queue.start();
    }

    // Fabian (30/11) - XML Loaded //
    // Anton (13/12) - refactored using factories //
    private function xmlCompleteHandler(event:Event):void
    {
        // init
        var pagesXML = new XML(event.target.data);
        var pages:Vector.<PageVO> = new Vector.<PageVO>();

        // loop pages
        for each(var page:XML in pagesXML.pages.page) {
            // use factory to build the PageVO's
            var pageVo:PageVO = PageVOFactory.createFromXML(page);

            pages.push(pageVo);
        }

        // exit application if there are no pages in the xml
        if (pages.length == 0) {
            NativeApplication.nativeApplication.exit();
        }

        // save the data
        this.pages = pages;
        this._selectedPageIndex = 0;
    }

    // Fabian (23/11) - Function Previous Page //
    public function goToPreviousPage():void
    {
        trace('[AppModel] Go to previous page');
    }

    // Fabian (23/11) - Function Next Page //
    public function goToNextPage():void
    {
        trace('[AppModel] Go to next page');
    }

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
            dispatchEvent(new Event(PAGES_CHANGED));
        }
    }

    public function get pageManager():PageManager
    {
        return _pageManager;
    }
}
}

internal class Enforcer{};