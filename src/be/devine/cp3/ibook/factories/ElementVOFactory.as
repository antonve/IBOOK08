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
import be.devine.cp3.ibook.vo.ImageVO;
import be.devine.cp3.ibook.vo.SolidVO;
import be.devine.cp3.ibook.vo.TextVO;
import be.devine.cp3.ibook.vo.TitleVO;

import flash.utils.getDefinitionByName;

public class ElementVOFactory
{
    public function ElementVOFactory()
    {
    }

    public static function createFromXML(el:XML):ElementVO
    {
        switch ("" + el.@type) {
            case 'text': return createVO('be.devine.cp3.ibook.vo.TextVO', el); break;
            case 'title': return createVO('be.devine.cp3.ibook.vo.TitleVO', el); break;
            case 'solid': return createVO('be.devine.cp3.ibook.vo.SolidVO', el); break;
            case 'img': return createVO('be.devine.cp3.ibook.vo.ImageVO', el); break;
        }

        throw new FactoryError('invalid XML for element: ' + el);
    }

    private static function parsePoint(str:String):Array
    {
        return str.split(',');
    }

    private static function createVO(type:String, el:XML):ElementVO
    {
        // make sure the VO's are compiled as well, without these you'll get an error.
        var imageVO:ImageVO;
        var solidVO:SolidVO;
        var textVO:TextVO;
        var titleVO:TitleVO;

        // create VO
        var coords:Array = parsePoint(el.@pos);
        var dim:Array = parsePoint(el.@size);
        var appClass:Class = getDefinitionByName(type) as Class;
        var vo:ElementVO = new appClass(el, coords[0], coords[1], dim[0], dim[1]);

        return vo;
    }
}
}
