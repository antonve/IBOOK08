package be.devine.cp3.ibook.view.engines {

import be.devine.cp3.ibook.vo.TextVO;

import flash.display.BitmapData;

import flash.text.TextField;
import flash.text.TextFormat;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class TextEngine {

    // -- Properties -- //

    private var renderStage:Sprite;

    // -- Constructor -- //

    public function TextEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    // -- Methods -- //

    // refactored to use native textfields, so the appearance of text can be configured more precisely
    public function render(textContent:TextVO, index:uint):void
    {
        // set textformat
        var TFOR:TextFormat = new TextFormat("Helvetica", 16, 0x000000);
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
        bitmapData.draw(nativeTF); trace(nativeTF);

        // apply bitmap data to quad and set the position
        var texture:Texture = Texture.fromBitmapData(bitmapData);
        var img:Image = new Image(texture);
        img.x = textContent.x;
        img.y = textContent.y;

        // and we're done
        renderStage.addChildAt(img, index);
    }

}
}
