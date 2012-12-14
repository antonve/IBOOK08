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

        var textField = new TextField(title.width, title.height, title.text, "Helvetica", 32, 0x000000);
        textField.hAlign = HAlign.LEFT;
        textField.vAlign = VAlign.TOP;
        textField.x = title.x;
        textField.y = title.y;

        renderStage.addChild(textField);
    }

}
}
