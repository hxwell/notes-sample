package hx.well.provider;

import hx.well.facades.DBStatic;

class CreateDatabaseProvider extends AbstractProvider {
    public function boot():Void {
        try {
            DBStatic.query("CREATE TABLE users(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT NOT NULL UNIQUE,
                password TEXT NOT NULL
            );");
        } catch (e) {
            // Possible: Table already exists
        }

        try {
            DBStatic.query("CREATE TABLE notes(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                title TEXT NOT NULL,
                content TEXT NOT NULL
            );");
        } catch (e) {
            // Possible: Table already exists
        }
    }
}
