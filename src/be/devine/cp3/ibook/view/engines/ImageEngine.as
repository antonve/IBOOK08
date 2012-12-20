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
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.geom.Matrix;
import flash.utils.Dictionary;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;


public class ImageEngine
{
    // properties
    private var renderStage:Sprite;
    private var vo:Dictionary;
    private var _index:Dictionary;

    // methods
    public function ImageEngine(stage:Sprite)
    {
        renderStage = stage;
        _index = new Dictionary();
        vo = new Dictionary();
    }

    public function render(image:ImageVO, index:uint):void
    {
        vo[index] = image as ImageVO;

        var q:RequestQueue = AppModel.getInstance().queue;
        var task:ImageTask = new ImageTask('assets/images/' + image.path);
        q.add(task);
        _index[task] = index.toString();

        var dummy:Sprite = new Sprite();
        dummy.name = 'dummy' + index;
        renderStage.addChildAt(dummy, index);
        trace('kankr');

        task.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, IOErrorHandler)
        task.addEventListener(Event.COMPLETE, completeHandler);
    }

    private function IOErrorHandler(e:IOErrorEvent):void
    {
        trace ('URL not found');
    }

    private function completeHandler(event:Event):void
    {
        // get image from the event
        var img:ImageTask = event.target.image as ImageTask;
        var dummy:Sprite = renderStage.getChildAt(_index[img]) as Sprite;
        var index:String = dummy.name.substr(5);

        // calculate scales in case the width of the original image isn't the same as in the xml
        var scaleHeight:Number = vo[index].height / img.height;
        var scaleWidth:Number = vo[index].width / img.width;
        var matrix:Matrix = new Matrix();
        matrix.scale(scaleWidth, scaleHeight);

        // resize the data
        var bd:BitmapData = new BitmapData(vo[index].width, vo[index].height, true, 0x000000);
        bd.draw(img, matrix, null, null, null, true);

        // create starling image
        var texture:Texture = Texture.fromBitmapData(bd);
        var finalImg:Image = new Image(texture);
        finalImg.x = vo[index].x;
        finalImg.y = vo[index].y;
        finalImg.name = 'image' + _index[img];
        renderStage.addChild(finalImg);
        renderStage.swapChildren(dummy,finalImg);
        renderStage.removeChild(dummy, true);

        trace('kukuku');
    }
}
}
