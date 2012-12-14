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
import be.devine.cp3.ibook.view.components.buttons.NextButton;
import be.devine.cp3.ibook.view.components.buttons.OverviewButton;
import be.devine.cp3.ibook.view.components.buttons.PrevButton;

import starling.display.Quad;

import starling.display.Sprite;

public class UI extends Sprite
{
    public function UI()
    {
        var appModel:AppModel = AppModel.getInstance();

        // draw bar at the bottom
        drawSolid(0xde1235, appModel.renderStage.width, 100, 0, appModel.renderStage.height - 100);


        // overview button
        var btnOverview:OverviewButton = new OverviewButton();
        btnOverview.x = (appModel.renderStage.width) / 2; //447
        btnOverview.y = (appModel.renderStage.height - 50); //697
        addChild(btnOverview);

        // next button
        var btnNext:NextButton = new NextButton();
        btnNext.x = (appModel.renderStage.width) / 4 * 3;
        btnNext.y = (appModel.renderStage.height - 50);
        addChild(btnNext);

        // prev button
        var btnPrev:PrevButton = new PrevButton();
        btnPrev.x = (appModel.renderStage.width) / 4;
        btnPrev.y = (appModel.renderStage.height - 50);
        addChild(btnPrev);
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
