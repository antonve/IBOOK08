package be.devine.cp3.ibook.view.engines {
import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.TitleVO;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TitleEngine {

    // -- Properties -- //

    private var renderStage:Sprite;
    private var _textField:TextField;

    // -- Constructor -- //

    public function TitleEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    // -- Methods -- //

    public function render(title:Object):void
    {
        if ( !(title is TitleVO)) {
            throw new EngineError('This engine can only render Titles.');
        }

        _textField = new TextField(400, 60, title.text, "Helvetica", 32, 0x000000);
        _textField.hAlign = HAlign.LEFT;
        _textField.vAlign = VAlign.TOP;
        _textField.x = title.x;
        _textField.y = title.y;

        renderStage.addChild(_textField);
    }

}
}
