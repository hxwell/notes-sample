package hx.well.handler.api.note;

import hx.well.handler.AbstractHandler;
import hx.well.http.AbstractResponse;
import hx.well.http.Request;
import hx.well.http.RequestStatic.auth;
import hx.well.model.User;
import hx.well.model.Note;

class ListNotesHandler extends AbstractHandler {
    public function execute(request:Request):AbstractResponse {
        var user:User = auth().user();
        return Note.instance.where("user_id", user.id).get();
    }
}