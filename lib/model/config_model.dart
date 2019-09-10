class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

   Map<String, dynamic> toJson()
  {
    Map<String,dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = searchUrl;
    return data;
  }
}


