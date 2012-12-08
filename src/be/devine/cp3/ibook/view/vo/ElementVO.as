/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 08/12/12
 * Time: 19:46
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.vo
{
public class ElementVO
{
    // properties
    protected var _x:Number;
    protected var _y:Number;
    protected var _width:uint;
    protected var _height:uint;

    // methods
    public function ElementVO()
    {
    }

    // getter & setters
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
