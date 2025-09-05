package hx.well.config;
import haxe.ds.StringMap;
import hx.well.facades.Environment.env;
using Std;
class DatabaseConfig implements IConfig {
    public function new() {}

    public var connections:StringMap<ConnectionConfig> = [
        "default" => {
            "driver": env("DB_DRIVER"),
            "path": env("DB_PATH"),
        }
    ];
}


typedef ConnectionConfig = {
    driver:String,
    ?path:String,
    ?host:String,
    ?port:Int,
    ?username:String,
    ?password:String
}