package hx.well.handler.api.note;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.http.RequestStatic.auth;
import hx.well.model.Note;
import hx.well.model.User;
import hx.well.http.RequestStatic.RequestStatic.request;
import hx.well.validator.ValidatorRule;

class GetNoteHandler extends AbstractHandler {
    public override function validate():Bool {
        return request().validate([
            "id" => [ValidatorRule.Required, ValidatorRule.Int]
        ]);
    }

    public function execute(request:Request):AbstractResponse {
        var user:User = auth().user();
        return Note.instance.where(["user_id" => user.id, "id" => request.post("id")]).first();
    }
}