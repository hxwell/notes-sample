package hx.well.config;
import hx.well.provider.BootProvider;
import hx.well.provider.CreateDatabaseProvider;
import hx.well.provider.AbstractProvider;
class ProviderConfig implements IConfig {
    public function new() {}

    public function get():Array<Class<AbstractProvider>> {
        return [
            CreateDatabaseProvider,
            BootProvider
        ];
    }
}