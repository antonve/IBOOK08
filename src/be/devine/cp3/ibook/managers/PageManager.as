/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 15:15
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.managers
{
import avmplus.getQualifiedClassName;

import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.view.engines.ImageEngine;
import be.devine.cp3.ibook.view.engines.SolidEngine;
import be.devine.cp3.ibook.view.engines.TextEngine;
import be.devine.cp3.ibook.view.engines.TitleEngine;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.PageVO;
import be.devine.cp3.ibook.vo.SolidVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitleVO;

import starling.display.Sprite;

public class PageManager
{
    private var appModel:AppModel;
    private var solidEngine:SolidEngine;
    private var imageEngine:ImageEngine;
    private var textEngine:TextEngine;
    private var titleEngine:TitleEngine;
    private var _index:uint;

    private static var instance:PageManager;

    public function PageManager(e:Enforcer)
    {
        if (e == null) {
            throw new Error('AppModel is a singleton.');
        }

        appModel = AppModel.getInstance();
        solidEngine = new SolidEngine(appModel.renderStage);
        imageEngine = new ImageEngine(appModel.renderStage);
        textEngine = new TextEngine(appModel.renderStage);
        titleEngine = new TitleEngine(appModel.renderStage);
        _index = 0;
    }

    public static function getInstance()
    {
        if (instance == null) {
            instance = new PageManager(new Enforcer());
        }

        return instance;
    }

    public function goToPreviousPage():void
    {
        if (hasPrevPage()) {
            appModel.selectedPageIndex--;
        }
    }

    public function goToNextPage():void
    {
        if (hasNextPage()) {
            appModel.selectedPageIndex++;
        }
    }

    public function hasNextPage():Boolean
    {
        return appModel.selectedPageIndex < appModel.pages.length-1;
    }

    public function hasPrevPage():Boolean
    {
        return appModel.selectedPageIndex !== 0;
    }

    public function renderPage(id:uint):void
    {
        // get the page data
        var page:PageVO = appModel.getPageById(id);

        // loop all elements and render them
        for each (var el:ElementVO in page.elements) {
            // get classname and choose render engine depending on the type
            switch (getQualifiedClassName(el).split('::').pop()) {
                case 'SolidVO': solidEngine.render(el as SolidVO, _index++); break;
                case 'ImageVO': imageEngine.render(el as ImageVO, _index); break;
                case 'TextVO': textEngine.render(el as TextVO, _index++); break;
                case 'TitleVO': titleEngine.render(el as TitleVO, _index++); break;
            }
        }
    }
}
}

internal class Enforcer{};
