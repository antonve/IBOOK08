package be.devine.cp3.ibook.view.engines {

import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.TextVO;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextEngine {

    // -- Properties -- //

    private var renderStage:Sprite;
    private var _textField:TextField;

    // -- Constructor -- //

    public function TextEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    // -- Methods -- //

    public function render(textContent:Object):void
    {
        if ( !(textContent is TextVO)) {
            throw new EngineError('This engine can only render Text.');
        }

        _textField = new TextField(textContent.width, textContent.height, textContent.text, "Helvetica", 16, 0x000000);
        _textField.hAlign = HAlign.LEFT;
        _textField.vAlign = VAlign.TOP;
        _textField.x = textContent.x;
        _textField.y = textContent.y;

        renderStage.addChild(_textField);
    }

}
}
