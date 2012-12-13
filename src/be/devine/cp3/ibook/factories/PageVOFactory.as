/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 13:25
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factories
{
import be.devine.cp3.ibook.vo.ElementVO;

public class PageVOFactory
{
    // methods
    public function PageVOFactory()
    {
    }

    public static function createFromXML(p:XML)
    {
        //trace(p);
        var els:Vector.<ElementVO> = new Vector.<ElementVO>();

        for each (var element:XML in p.*) {
            //els.push()
        }
    }
}
}
