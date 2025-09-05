package hx.well.route;
import hx.well.middleware.GuardMiddleware;
import hx.well.http.Request;
using hx.well.tools.RouteElementTools;

class AdminRoute extends RouteGroup {
    public function template():Void {
        Route.get("/guard").handle((request:Request) -> {
            return request.currentGuard();
        });
    }
}

typedef AdminGuardMiddleware = GuardMiddleware<"admin">;