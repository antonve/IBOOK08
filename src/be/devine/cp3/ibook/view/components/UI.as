/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 14/12/12
 * Time: 19:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.components
{
import be.devine.cp3.ibook.managers.PageManager;
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.components.buttons.MainButton;
import be.devine.cp3.ibook.view.components.buttons.NextButton;
import be.devine.cp3.ibook.view.components.buttons.OverviewButton;
import be.devine.cp3.ibook.view.components.buttons.PrevButton;

import flash.events.Event;
import flash.ui.Keyboard;

import starling.core.Starling;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;

public class UI extends Sprite
{
    private var appModel:AppModel;
    private var btnNext:NextButton;
    private var btnPrev:PrevButton;
    private var hasNext:Boolean;
    private var hasPrev:Boolean;
    private var pageManager:PageManager;

    public function UI()
    {
        pageManager = PageManager.getInstance();
        appModel = AppModel.getInstance();
        hasNext = false;
        hasPrev = false;

        // draw bar at the bottom
        drawSolid(0xde1235, appModel.renderStage.width, 100, 0, appModel.renderStage.height - 100);


        // overview button
        renderBtnOverview();

        // next/prev button
        renderBtnNext();
        renderBtnPrev();

        if (pageManager.hasNextPage()) {
            hasNext = true;
            addChild(btnNext);
        }

        appModel.addEventListener(AppModel.SELECTED_PAGE_CHANGED, appModel_selectedPageChangedHandler);
        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
    }

    private function renderBtnOverview():void
    {
        var btnOverview:OverviewButton = new OverviewButton();
        btnOverview.x = (appModel.renderStage.width) / 2; //447
        btnOverview.y = (appModel.renderStage.height - 50); //697
        btnOverview.addEventListener(MainButton.CLICKED, btnOverview_clickedHandler);
        addChild(btnOverview);
    }

    private function renderBtnNext():void
    {
        btnNext = new NextButton();
        btnNext.x = (appModel.renderStage.width) / 4 * 3;
        btnNext.y = (appModel.renderStage.height - 50);
        btnNext.addEventListener(MainButton.CLICKED, btnNext_clickedHandler);
    }

    private function renderBtnPrev():void
    {
        btnPrev = new PrevButton();
        btnPrev.x = (appModel.renderStage.width) / 4;
        btnPrev.y = (appModel.renderStage.height - 50);
        btnPrev.addEventListener(MainButton.CLICKED, btnPrev_clickedHandler);
    }


    private function drawSolid(color:uint, width:uint, height:uint, x:uint, y:uint):void
    {
        var q:Quad = new Quad(width, height, color);
        q.x = x;
        q.y = y;

        addChild(q);
    }

    private function btnOverview_clickedHandler(event:starling.events.Event):void
    {
        trace('overview CLICKED');
    }

    private function btnNext_clickedHandler(event:starling.events.Event):void
    {
        pageManager.goToNextPage();
    }

    private function btnPrev_clickedHandler(event:starling.events.Event):void
    {
        pageManager.goToPreviousPage();
    }

    private function appModel_selectedPageChangedHandler(event:flash.events.Event):void
    {
        // handle visual state of the next button
        if (!hasNext && pageManager.hasNextPage()) {
            hasNext = true;
            addChild(btnNext);
        } else if (hasNext && !pageManager.hasNextPage()) {
            hasNext = false;
            removeChild(btnNext);
        }

        // handle visual state of the previous button
        if (!hasPrev && pageManager.hasPrevPage()) {
            hasPrev = true;
            addChild(btnPrev);
        } else if (hasPrev && !pageManager.hasPrevPage()) {
            hasPrev = false;
            removeChild(btnPrev);
        }
    }

    private function keyDownHandler(e:KeyboardEvent):void
    {
        Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
        if (e.keyCode == Keyboard.RIGHT) {
            pageManager.goToNextPage();
        }
        if (e.keyCode == Keyboard.LEFT) {
            pageManager.goToPreviousPage();
        }
    }

    private function keyUpHandler(e:KeyboardEvent):void
    {
        Starling.current.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);

    }
}
}
