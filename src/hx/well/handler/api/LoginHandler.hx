package hx.well.handler.api;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.model.User;
import hx.well.http.RequestStatic.request;
import hx.well.http.ResponseBuilder;
import hx.well.http.RequestStatic.auth;
import hx.well.validator.ValidatorRule;

class LoginHandler extends AbstractHandler {
    public override function validate():Bool {
        return request().validate([
            "username" => [ValidatorRule.Required, ValidatorRule.String],
            "password" => [ValidatorRule.Required, ValidatorRule.String]
        ]);
    }

    public function execute(request:Request):AbstractResponse {
        var credentials = request.only("username", "password");
        if (!auth().attempt(credentials))
            return ResponseBuilder.asJson({message: "username or password is invalid!"}, 401);

        var user:User = auth().user();
        return {
            success: true,
            user: user,
            redirect: "/"
        };
    }
}