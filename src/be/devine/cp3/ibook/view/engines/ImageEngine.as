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
import flash.geom.Matrix;
import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;


public class ImageEngine
{
    // properties
    private var renderStage:Sprite;
    private var vo:ImageVO;

    // methods
    public function ImageEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    public function render(image:Object):void
    {
        trace('render image');
        if ( !(image is ImageVO)) {
            throw new EngineError('This engine can only render Images.');
        }

        vo = image as ImageVO;

        var q:RequestQueue = AppModel.getInstance().queue;
        var task:ImageTask = new ImageTask('assets/images/' + image.path);
        q.add(task);

        task.addEventListener(Event.COMPLETE, completeHandler)
    }

    private function completeHandler(event:Event):void
    {
        // get image from the event
        var img:ImageTask = event.target.image as ImageTask;

        // calculate scales in case the width of the original image isn't the same as in the xml
        var scaleHeight:Number = vo.height / img.height;
        var scaleWidth:Number = vo.width / img.width;
        var matrix:Matrix = new Matrix();
        matrix.scale(scaleWidth, scaleHeight);

        // resize the data
        var bd:BitmapData = new BitmapData(vo.width, vo.height, true);
        bd.draw(img, matrix, null, null, null, true);

        // create starling image
        var texture:Texture = Texture.fromBitmapData(bd);
        var finalImg:Image = new Image(texture);
        finalImg.x = vo.x;
        finalImg.y = vo.y;

        renderStage.addChild(finalImg);
    }
}
}
