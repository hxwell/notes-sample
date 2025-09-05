package hx.well.route;
import hx.well.middleware.RequireAuthMiddleware;
import hx.well.http.ResponseBuilder;
import hx.well.middleware.GuestMiddleware;
import hx.well.handler.LogoutHandler;
using hx.well.tools.RouteElementTools;

class WebRoute extends RouteGroup {
    public function template():Void {
        Route.redirect("/", "/auth");

        Route.middleware([new GuestMiddleware<"default">()]).group(() -> {
            Route.get("/auth")
                .handle((_) -> ResponseBuilder.asTemplate("auth")).name("login");
        });

        Route.middleware([new RequireAuthMiddleware<"default">()]).group(() -> {
            Route.get("/logout")
                .handler(new LogoutHandler());

            // Note management
           Route.get("/notes")
                .handle((_) -> ResponseBuilder.asTemplate("notes")).name("home");
        });
    }
}