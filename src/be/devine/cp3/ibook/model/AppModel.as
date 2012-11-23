package be.devine.cp3.ibook.model {

import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher {

    // -- Properties -- //

    public static const SELECTED_PAGE_CHANGED:String = "selectedPageChanged";
    public static const PAGES_CHANGED:String = "pagesChanged";

    private var _selectedPageIndex:int;
    private var _pages:Vector.<String>;

    // -- Constructor -- //

    public function AppModel()
    {
        trace('[AppModel] CONTSRUCT');
    }

    // -- Methods -- //

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