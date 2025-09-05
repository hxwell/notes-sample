package hx.well.route;
import hx.well.handler.api.RegisterHandler;
import hx.well.handler.api.UserHandler;
import hx.well.handler.api.LoginHandler;
import hx.well.handler.api.note.ListNotesHandler;
import hx.well.handler.api.note.CreateNoteHandler;
import hx.well.middleware.RequireAuthMiddleware;
import hx.well.middleware.GuestMiddleware;
import hx.well.handler.api.note.GetNoteHandler;
import hx.well.handler.api.note.UpdateNoteHandler;
import hx.well.handler.api.note.DeleteNoteHandler;
using hx.well.tools.RouteElementTools;

class ApiRoute extends RouteGroup {
    public function template():Void {
        Route.middleware([new GuestMiddleware<"default">()]).group(() -> {
            Route.post("/login")
                .handler(new LoginHandler());

            Route.post("/register")
                .handler(new RegisterHandler());
        });

        Route.middleware([new RequireAuthMiddleware<"default">()]).group(() -> {
            Route.post("/user")
                .handler(new UserHandler());

            Route.path("/notes").group(() -> {
                Route.post("/get")
                    .handler(new GetNoteHandler());

                Route.post("/create")
                    .handler(new CreateNoteHandler());

                Route.post("/delete")
                    .handler(new DeleteNoteHandler());

                Route.post("/update")
                    .handler(new UpdateNoteHandler());

                Route.get("/list")
                    .handler(new ListNotesHandler());
            });
        });
    }
}