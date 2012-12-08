/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 07/12/12
 * Time: 19:52
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.vo
{
public class SolidVO extends ElementVO
{
    // properties
    private var _color:uint;

    // methods
    public function SolidVO(color:uint, x:Number, y:Number, width:uint, height:uint)
    {
        this._color = color;
        this._x = x;
        this._y = y;
        this._width = width;
        this._height = height;
    }

    // getter & setters
    public function get color():uint
    {
        return _color;
    }

    public function set color(value:uint):void
    {
        _color = value;
    }
}
}
