/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 07/12/12
 * Time: 19:47
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.vo
{
public class TextVO extends ElementVO
{
    // properties
    private var _text:String;

    // methods
    public function TextVO(text:String, x:Number, y:Number, width:uint, height:uint)
    {
        _text = text;
        _x = x;
        _y = y;
        _width = width;
        _height = height;
    }

    // getter & setters
    public function get text():String
    {
        return _text;
    }

    public function set text(value:String):void
    {
        _text = value;
    }
}
}
