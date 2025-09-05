package hx.well.provider;

import hx.well.route.Route;
import hx.well.route.ApiRoute;
import hx.well.middleware.GuardMiddleware;
import hx.well.route.AdminRoute;
import hx.well.route.WebRoute;
using hx.well.tools.RouteElementTools;

class BootProvider extends AbstractProvider {
    public function boot():Void {
        Route.path("/")
            .group(WebRoute);

        Route.path("/api")
            .group(ApiRoute);

        Route.path("/admin")
            //.middleware([RequireAuthMiddleware])
            .group(AdminRoute);

        Route.redirect("/hxwell", "https://github.com/hxwell/hxwell");
    }
}