/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 18:15
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.engines
{
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.ImageVO;

import cp3.requestQueue.ImageTask;

import cp3.requestQueue.RequestQueue;

import flash.events.Event;

import starling.display.Sprite;


public class ImageEngine
{
    // properties
    private var renderStage:Sprite;

    // methods
    public function ImageEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    public function render(image:Object):void
    {
        if ( !(image is ImageVO)) {
            throw new EngineError('This engine can only render Images.');
        }

        var q:RequestQueue = AppModel.getInstance().queue;
        q.add(new ImageTask('assets/images/' + image.path));
        q.addEventListener(Event.COMPLETE, completeHandler)
    }

    private function completeHandler(event:Event):void
    {

    }
}
}
