/**
 * Created with IntelliJ IDEA.
 * User: antonvaneechaute
 * Date: 13/12/12
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.ibook.model.errors
{
public class FactoryError extends Error
    {
        public function FactoryError(msg:String):void
        {
            super(msg);
        }
}
}
