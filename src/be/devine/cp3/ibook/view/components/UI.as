/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 14/12/12
 * Time: 19:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.components
{
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.components.buttons.OverviewButton;

import starling.display.Quad;

import starling.display.Sprite;

public class UI extends Sprite
{
    public function UI()
    {
        var appModel:AppModel = AppModel.getInstance();
        drawSolid(0xde1235, appModel.renderStage.width, 100, 0, appModel.renderStage.height - 100);


        var button:OverviewButton = new OverviewButton();
        button.x = 447;
        button.y = 697;

        addChild(button);
    }

    private function drawSolid(color:uint, width:uint, height:uint, x:uint, y:uint):void
    {
        var q:Quad = new Quad(width, height, color);
        q.x = x;
        q.y = y;

        addChild(q);
    }
}
}
