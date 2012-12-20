/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 20/12/12
 * Time: 07:05
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.engines
{
import be.devine.cp3.ibook.vo.TextVO;

import flash.display.BitmapData;

import flash.text.TextField;

import flash.text.TextFormat;

import starling.display.Image;
import starling.textures.Texture;

public class BasicTextEngine
{
    public function BasicTextEngine()
    {
    }

    protected function buildImage(textContent:TextVO, font:String, size:uint, color:uint):Image
    {
        // set textformat
        var TFOR:TextFormat = new TextFormat(font, size, color);
        TFOR.leading = 10;

        // create and configure textfield
        var nativeTF:TextField = new TextField();
        nativeTF.defaultTextFormat = TFOR;
        nativeTF.width = textContent.width;
        nativeTF.height = textContent.height;
        nativeTF.text = textContent.text;
        nativeTF.multiline = true;
        nativeTF.wordWrap = true;
        nativeTF.antiAliasType = "advanced";

        // convert to bitmap data
        var bitmapData:BitmapData = new BitmapData(textContent.width, textContent.height, true, 0x0);
        bitmapData.draw(nativeTF);

        // apply bitmap data to quad and set the position
        var texture:Texture = Texture.fromBitmapData(bitmapData);
        var img:Image = new Image(texture);
        img.x = textContent.x;
        img.y = textContent.y;

        // and we're done
        return img;
    }
}
}
