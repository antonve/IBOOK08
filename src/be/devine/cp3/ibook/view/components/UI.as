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
import be.devine.cp3.ibook.view.components.buttons.MainButton;
import be.devine.cp3.ibook.view.components.buttons.NextButton;
import be.devine.cp3.ibook.view.components.buttons.OverviewButton;
import be.devine.cp3.ibook.view.components.buttons.PrevButton;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;

public class UI extends Sprite
{
    private var appModel:AppModel;

    public function UI()
    {
        appModel = AppModel.getInstance();

        // draw bar at the bottom
        drawSolid(0xde1235, appModel.renderStage.width, 100, 0, appModel.renderStage.height - 100);


        // overview button
        renderBtnOverview();

        // next button
        renderBtnNext();

        // prev button
        renderBtnPrev();
    }

    private function renderBtnOverview():void
    {
        var btnOverview:OverviewButton = new OverviewButton();
        btnOverview.x = (appModel.renderStage.width) / 2; //447
        btnOverview.y = (appModel.renderStage.height - 50); //697
        btnOverview.addEventListener(MainButton.CLICKED, btnOverview_clickedHandler)
        addChild(btnOverview);
    }

    private function renderBtnNext():void
    {
        var btnNext:NextButton = new NextButton();
        btnNext.x = (appModel.renderStage.width) / 4 * 3;
        btnNext.y = (appModel.renderStage.height - 50);
        addChild(btnNext);
    }

    private function renderBtnPrev():void
    {
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

    private function btnOverview_clickedHandler(event:Event):void
    {
        trace('overview CLICKED');
    }
}
}
