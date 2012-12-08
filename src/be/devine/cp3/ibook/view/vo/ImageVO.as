/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 07/12/12
 * Time: 19:55
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.vo
{
public class ImageVO extends ElementVO
{
    // properties
    private var _path:String;

    // methods
    public function ImageVO(path:String, x:Number, y:Number, width:uint, height:uint)
    {
        _path = path;
        _x = x;
        _y = y;
        _width = width;
        _height = height;
    }

    // getter & setters
    public function get path():String
    {
        return _path;
    }

    public function set path(value:String):void
    {
        _path = value;
    }
}
}
