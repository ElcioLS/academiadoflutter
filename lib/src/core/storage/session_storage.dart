import 'dart:html';

import 'storage.dart';

class SessionStorage extends Storage {
  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  @override
  void get clean => window.sessionStorage.clear();
}
