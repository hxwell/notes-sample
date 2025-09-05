package hx.well.model;

import hx.well.model.BaseModel;

@:connection("default")
@:table("notes")
@:build(hx.well.macro.ModelMacro.build())
class Note extends BaseModel<Note> {
    public static var instance:Note;

    @:primary
    @:visible
    @:field
    public var id:Int;

    //@:visible
    @:field
    public var user_id:Int;

    @:visible
    @:field
    public var title:String;

    @:visible
    @:field
    public var content:String;

    public function new() {
        super();
    }
}