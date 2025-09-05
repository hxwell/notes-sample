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
        #if hl
        trace("user_id", user.id); // user id sometimes returns different value in hashlink shit
        #end
        return Note.instance.where("user_id", user.id).get();
    }
}