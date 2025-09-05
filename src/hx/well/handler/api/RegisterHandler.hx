package hx.well.handler.api;
import hx.well.validator.ValidatorRule;
import hx.well.http.RequestStatic.RequestStatic.auth;
import hx.well.http.AbstractResponse;
import hx.well.http.ResponseBuilder;
import hx.well.http.RequestStatic.request;
import hx.well.http.Request;
import hx.well.model.User;
import hx.well.facades.Hash;
class RegisterHandler extends AbstractHandler {
    public override function validate():Bool {
        return request().validate([
            "username" => [ValidatorRule.Required, ValidatorRule.String],
            "password" => [ValidatorRule.Required, ValidatorRule.String, ValidatorRule.Min(3), ValidatorRule.Max(16)]
        ]);
    }

    public function execute(request:Request):AbstractResponse {
        var username:String = request.post("username");
        var password:String = request.post("password");

        if (User.instance.where("username", username).exists())
            return ResponseBuilder.asJson({message: "Username already exists!"}, 400);

        var user = User.instance.create(["username" => username, "password" => Hash.make(password)]);
        auth().login(user);

        return ResponseBuilder.asJson({
            success: true,
            user: user
        });
    }
}