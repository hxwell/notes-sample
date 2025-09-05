package hx.well.handler.api.note;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.http.RequestStatic.auth;
import hx.well.http.RequestStatic.RequestStatic.request;
import hx.well.model.Note;
import hx.well.model.User;
import hx.well.validator.ValidatorRule;

class UpdateNoteHandler extends AbstractHandler {
    public override function validate():Bool {
        return request().validate([
            "id" => [ValidatorRule.Required, ValidatorRule.Int],
            "title" => [ValidatorRule.Required, ValidatorRule.String],
            "content" => [ValidatorRule.Required, ValidatorRule.String]
        ]);
    }

    public function execute(request:Request):AbstractResponse {
        var user:User = auth().user();
        var id:Int = request.post("id");
        var query = Note.instance.where(["user_id" => user.id, "id" => id]);
        query.update(request.only("title", "content"));
        return query.first();
    }
}