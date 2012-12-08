/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 08/12/12
 * Time: 20:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.view.engines
{
import be.devine.cp3.ibook.model.errors.EngineError;
import be.devine.cp3.ibook.vo.ElementVO;
import be.devine.cp3.ibook.vo.SolidVO;

public class SolidEngine implements IEngine
{
    // methods
    public function SolidEngine()
    {
    }

    public function render(stage:Object, element:ElementVO)
    {
        if ( !(element is SolidVO)) {
            throw new EngineError('This engine can only render Solids.');
        }


    }
}
}
