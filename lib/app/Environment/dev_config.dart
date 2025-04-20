import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get base => '{}';
  @override
  String get apiHost => '$base/api';
  @override
  String get apiVersion => 'api-version=1.0';
  @override
  String get imageHost => 'https://admin.africacrypto.com/icon';
}
