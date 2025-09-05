package hx.well.handler.api;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.model.User;
import hx.well.http.RequestStatic.auth;

class UserHandler extends AbstractHandler {
    public function execute(request:Request):AbstractResponse {
        var user:User = auth().user();
        return {
            success: true,
            user: user
        };
    }
}