package hx.well.handler.api.note;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.http.RequestStatic.auth;
import hx.well.model.Note;
import hx.well.model.User;
import hx.well.http.RequestStatic.RequestStatic.request;
import hx.well.validator.ValidatorRule;

class CreateNoteHandler extends AbstractHandler {
    public function execute(request:Request):AbstractResponse {
        var user:User = auth().user();
        return Note.instance.create(["user_id" => user.id, "title" => "New Note", "content" => ""]);
    }
}