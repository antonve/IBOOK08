/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 14:18
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.factories
{
import be.devine.cp3.ibook.model.errors.FactoryError;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.TextVO;

public class ElementVOFactory
{
    public function ElementVOFactory()
    {
    }

    public static function createFromXML(el:XML):ElementVO
    {
        switch ("" + el.@type) {
            case 'text': return createTextVO(el);
            //case 'title': return createTitleVO(el);
            //case 'solid': return createSolidVO(el);
            //case 'img': return createImageVO(el);
        }

        throw new FactoryError('invalid XML for element: ' + el);
    }

    private static function parseCoord(str:String):Array
    {
        return str.split(',');
    }

    private static function createTextVO(el:XML):TextVO
    {
        var coords:Array = parseCoord(el.@pos);
        var vo:TextVO = new TextVO(el, coords[0], coords[1], uint(el.@width), uint(el.@height));

        return vo;
    }
}
}
