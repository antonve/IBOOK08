/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 23:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.components.buttons
{
import be.devine.cp3.ibook.Style;
import be.devine.cp3.ibook.model.AppModel;

import cp3.requestQueue.ImageTask;

import cp3.requestQueue.RequestQueue;

import flash.display.BitmapData;

import flash.events.Event;

import starling.display.DisplayObject;
import starling.display.Image;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class MainButton extends Sprite
{
    private var _img:Image;
    private var _hoverImg:Image;
    private var _isHover:Boolean;
    private var _isReady:Boolean;

    public function MainButton(imgPath:String, imgHoverPath:String)
    {
        _isHover = false;
        _isReady = false;

        var queue:RequestQueue = AppModel.getInstance().queue;
        var imgTask:ImageTask = new ImageTask('assets/buttons/' + imgPath);
        var imgHoverTask:ImageTask = new ImageTask('assets/buttons/' + imgHoverPath);

        imgTask.addEventListener(Event.COMPLETE, imgTask_completeHandler)
        imgHoverTask.addEventListener(Event.COMPLETE, imgHoverTask_completeHandler)

        queue.add(imgTask);
        queue.add(imgHoverTask);
        queue.start();

        addEventListener(TouchEvent.TOUCH, buttonTouchHandler);
    }

    private function buttonTouchHandler(ev:TouchEvent):void
    {
        // if the images haven't loaded yet, don't do anything
        if (!_isReady) {
            return;
        }

        // switch images on hover
        if (ev.getTouch(ev.target as DisplayObject, TouchPhase.HOVER)) {
            removeChild(_img);
            addChild(_hoverImg);
            useHandCursor = true;
        }
        if (ev.getTouch(ev.target as DisplayObject) == null) {
            removeChild(_hoverImg);
            addChild(_img);
            useHandCursor = false;
        }
    }

    private function imgTask_completeHandler(event:Event):void
    {
        // get image from the event
        var img:ImageTask = event.target.image as ImageTask;

        _img = createImage(img);

        if (_hoverImg !== null) {
            _isReady = true;
            addChild(_img);
        }
    }

    private function imgHoverTask_completeHandler(event:Event):void
    {
        // get image from the event
        var img:ImageTask = event.target.image as ImageTask;

        _hoverImg = createImage(img);

        if (_img !== null) {
            trace('add');
            _isReady = true;
            addChild(_img);
        }
    }

    private function createImage(img:ImageTask):Image
    {
        // resize the data
        var bd:BitmapData = new BitmapData(img.width, img.height, true, 0x000000);
        bd.draw(img);

        // create starling image
        var texture:Texture = Texture.fromBitmapData(bd);
        var image:Image = new Image(texture);
        image.x = -1 * (image.width / 2);
        image.y = -1 * (image.height / 2);

        return image;
    }
}
}
