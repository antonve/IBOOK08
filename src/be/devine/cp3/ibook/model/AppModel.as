package be.devine.cp3.ibook.model {

import be.devine.cp3.ibook.factories.PageVOFactory;
import be.devine.cp3.ibook.vo.PageVO;

import cp3.requestQueue.RequestQueue;
import cp3.requestQueue.XMLTask;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.xml.XMLNode;

public class AppModel extends EventDispatcher {

    // -- Properties -- //

    public static const SELECTED_PAGE_CHANGED:String = "selectedPageChanged";
    public static const PAGES_CHANGED:String = "pagesChanged";

    private static var instance;

    private var _selectedPageIndex:int;
    private var _pages:Vector.<String>;

    private var _queue:RequestQueue;

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

    // Fabian (30/11) - Function Request Queue //
    public function loadPagesXML():void
    {
        _queue = new RequestQueue();

        // Load XML using Queue:
        var xmlTask:XMLTask = new XMLTask("assets/data.xml");
        xmlTask.addEventListener(Event.COMPLETE, xmlCompleteHandler);
        _queue.add(xmlTask);

        _queue.start();
    }

    // Fabian (30/11) - XML Loaded //
    private function xmlCompleteHandler(event:Event):void
    {
        trace('[AppModel] XML Load begin');

        var pagesXML = new XML(event.target.data);
        var pages:Vector.<PageVO> = new Vector.<PageVO>();
        //trace(pagesXML);
        for each(var page:XML in pagesXML.pages.page) {
            var pageVo:PageVO = PageVOFactory.createFromXML(page);

            pages.push(pageVo);
        }
        trace('[AppModel] XML Load end');

        //this.pages = pages;
        //this.currentPage = pages[0];
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
    public function get pages():Vector.<String>
    {
        return _pages;
    }

    // Fabian (23/11) - Setter pageUrls //
    public function set pages(value:Vector.<String>):void
    {
        if (_pages != value) {
            _pages = value;
            dispatchEvent(new Event(PAGES_CHANGED));
        }
    }

}
}

internal class Enforcer{};