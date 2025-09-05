package hx.well.handler;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.http.RequestStatic.auth;
import hx.well.http.ResponseBuilder;

class LogoutHandler extends AbstractHandler {
    public function execute(request:Request):AbstractResponse {
        auth().logout();
        return ResponseBuilder.asRedirectRoute("login");
    }
}