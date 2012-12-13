/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 15:15
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.managers
{
import be.devine.cp3.ibook.model.AppModel;
import be.devine.cp3.ibook.vo.PageVO;

public class PageManager
{
    private var appModel:AppModel;

    public function PageManager()
    {
        appModel = AppModel.getInstance();
    }

    public function renderPage(id:uint):void
    {
        var page:PageVO = appModel.getPageById(id);
        trace(page);
    }
}
}
