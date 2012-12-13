/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 13:25
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factories
{
import be.devine.cp3.ibook.model.errors.FactoryError;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.PageVO;

public class PageVOFactory
{
    // methods
    public function PageVOFactory()
    {
    }

    public static function createFromXML(p:XML):PageVO
    {
        //trace(p);
        var els:Vector.<ElementVO> = new Vector.<ElementVO>();

        for each (var element:XML in p.*) {
            try {
                els.push(ElementVOFactory.createFromXML(element));
            }
            catch (e:FactoryError) {
                trace ('failed loading element:', element);
            }
        }

        return new PageVO(els);
    }
}
}
