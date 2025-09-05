package hx.well.config;
import hx.well.middleware.DatabaseMiddleware;
import hx.well.middleware.AbstractMiddleware;
import hx.well.middleware.SessionMiddleware;
import hx.well.middleware.SampleMiddleware;
import hx.well.middleware.CorsMiddleware;
import hx.well.middleware.SessionAuthMiddleware;

class MiddlewareConfig implements IConfig {
    public function new() {}

    public function get():Array<Class<AbstractMiddleware>> {
        return [
            CorsMiddleware,
            DatabaseMiddleware,
            SessionMiddleware,
            SessionAuthMiddleware,
            SampleMiddleware
        ];
    }
}