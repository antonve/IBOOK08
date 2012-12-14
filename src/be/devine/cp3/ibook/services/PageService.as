/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 14/12/12
 * Time: 12:25
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.services
{
import be.devine.cp3.ibook.factories.PageVOFactory;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

import cp3.requestQueue.RequestQueue;
import cp3.requestQueue.XMLTask;

import flash.desktop.NativeApplication;

import flash.events.Event;

public class PageService
{
    private var pages:Array
    private var queue:RequestQueue;

    public function PageService()
    {
        queue = AppModel.getInstance().queue;
    }


    // Fabian (30/11) - Function Request Queue //
    // Anton (13/01 - Made path configurable, hardcoded paths are always a bad idea //
    public function loadPagesXML(path:String):void
    {
        // Load XML using Queue:
        var xmlTask:XMLTask = new XMLTask(path);
        xmlTask.addEventListener(Event.COMPLETE, xmlCompleteHandler);
        queue.add(xmlTask);

        queue.start();
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

        AppModel.getInstance().pages = pages;
    }
}
}
