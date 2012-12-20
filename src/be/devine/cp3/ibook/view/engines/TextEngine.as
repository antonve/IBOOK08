package be.devine.cp3.ibook.view.engines {

import be.devine.cp3.ibook.vo.TextVO;

import flash.display.BitmapData;

import flash.text.TextField;
import flash.text.TextFormat;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class TextEngine extends BasicTextEngine
{

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
        renderStage.addChildAt(buildImage(textContent, "Helvetica", 16, 0x000000), index);
    }
}
}
