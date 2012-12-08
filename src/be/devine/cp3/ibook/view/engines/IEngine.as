/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 08/12/12
 * Time: 19:56
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.engines
{
import be.devine.cp3.ibook.vo.ElementVO;

public interface IEngine
{
    function render(stage:Object, element:ElementVO);
}
}
