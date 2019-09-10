class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        hideAppBar: json['hideAppbar'],
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = hideAppBar;
    data['icon'] = icon;
    data['title'] = title;
    data['url'] = url;
    data['statusBarColor'] = statusBarColor;
    return data;
  }
}
