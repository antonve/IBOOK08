package be.devine.cp3.ibook.vo {

public class PageVO {

    // -- Properties -- //

    private var _elements:Vector.<ElementVO>;

    // -- Constructor -- //

    public function PageVO(els:Vector.<ElementVO>)
    {
        _elements = els;
    }

    // getter & setters

    public function get elements():Vector.<ElementVO>
    {
        return _elements;
    }

    public function set elements(value:Vector.<ElementVO>):void
    {
        _elements = value;
    }
}
}
