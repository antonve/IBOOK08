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
import be.devine.cp3.ibook.view.engines.SolidEngine;
import be.devine.cp3.ibook.view.engines.TextEngine;
import be.devine.cp3.ibook.view.engines.TitleEngine;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

public class PageManager
{
    private var appModel:AppModel;
    private var solidEngine:SolidEngine;
    private var textEngine:TextEngine;
    private var titleEngine:TitleEngine;

    public function PageManager()
    {
        appModel = AppModel.getInstance();
        solidEngine = new SolidEngine(appModel.renderStage);
        textEngine = new TextEngine(appModel.renderStage);
        titleEngine = new TitleEngine(appModel.renderStage);
    }

    public function renderPage(id:uint):void
    {
        // get the page data
        var page:PageVO = appModel.getPageById(id);

        // loop all elements and render them
        for each (var el:ElementVO in page.elements) {
            // get classname and choose render engine depending on the type
            switch (getQualifiedClassName(el).split('::').pop()) {
                case 'SolidVO': solidEngine.render(el); break;
                case 'TextVO': textEngine.render(el); break;
                case 'TitleVO': titleEngine.render(el); break;
            }
        }
    }
}
}
