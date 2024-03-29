/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 08/12/12
 * Time: 20:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.engines
{
import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.SolidVO;

import starling.display.Quad;

import starling.display.Sprite;

public class SolidEngine
{
    // properties
    private var renderStage:Sprite;

    // methods
    public function SolidEngine(stage:Sprite)
    {
        renderStage = stage;
    }

    public function render(solid:SolidVO, index:uint):void
    {
        var q:Quad = new Quad(solid.width, solid.height, solid.color);
        q.x = solid.x;
        q.y = solid.y;
        q.name = 'quad' + index;

        renderStage.addChildAt(q, index);
    }
}
}
