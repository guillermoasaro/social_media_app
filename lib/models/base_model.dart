import 'dart:convert';

abstract class BaseModelx {
  Map<String, dynamic> toMap();
  BaseModelx.fromMap(Map<String, dynamic> map);

  factory BaseModelx.fromJson(String str) => BaseModelx.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());
}


abstract class BaseModel {
  late BaseModelFactory baseFactory;

  Map<String, dynamic> toMap();
  BaseModelFactory getFactoryInstance();
}

abstract class BaseModelFactory {
  BaseModel fromMap(Map<String, dynamic> json);
}