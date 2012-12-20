package be.devine.cp3.ibook.view.engines {
import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.TitleVO;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TitleEngine extends BasicTextEngine
{

    // -- Properties -- //

    private var renderStage:Sprite;

    // -- Constructor -- //

    public function TitleEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    // -- Methods -- //

    public function render(textContent:TitleVO, index:uint):void
    {
        renderStage.addChildAt(buildImage(textContent, "Helvetica", 32, 0x000000), index);
    }

}
}
