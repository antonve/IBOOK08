/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 07/12/12
 * Time: 19:47
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.vo
{
public class TextVO
{
    // properties
    private var _text:String;
    private var _x:Number;
    private var _y:Number;
    private var _width:uint;
    private var _height:uint;

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

    public function get x():Number
    {
        return _x;
    }

    public function set x(value:Number):void
    {
        _x = value;
    }

    public function get y():Number
    {
        return _y;
    }

    public function set y(value:Number):void
    {
        _y = value;
    }

    public function get width():uint
    {
        return _width;
    }

    public function set width(value:uint):void
    {
        _width = value;
    }

    public function get height():uint
    {
        return _height;
    }

    public function set height(value:uint):void
    {
        _height = value;
    }
}
}
