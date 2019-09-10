import 'package:trip_app/model/common_model.dart';

class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: CommonModel.fromJson(json['mainItem']),
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4']),
    );
  }

   Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] =  startColor;
    data['endColor'] = endColor;
    data['mainItem'] = mainItem.toJson();
    data['item1'] = item1.toJson();
    data['item2'] = item2.toJson();
    data['item3'] = item3.toJson();
    data['item4'] = item4.toJson();
    return data;
  }
}
