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

        var textField = new TextField(textContent.width, textContent.height, textContent.text, "Helvetica", 16, 0x000000);
        textField.hAlign = HAlign.LEFT;
        textField.vAlign = VAlign.TOP;
        textField.x = textContent.x;
        textField.y = textContent.y;

        renderStage.addChild(textField);
    }

}
}
