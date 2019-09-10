import 'package:trip_app/model/common_model.dart';
import 'package:trip_app/model/config_model.dart';
import 'package:trip_app/model/grid_nav_model.dart';
import 'package:trip_app/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel girdNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;
  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.girdNav,
      this.subNavList,
      this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    var localNavListJson = json['localNavList'] as List;
    var subNavListJson = json['subNavList'] as List;
    return json != null
        ? HomeModel(
            config: ConfigModel.fromJson(json['config']),
            bannerList: bannerListJson
                .map((e) => CommonModel.fromJson(e))
                .toList(),
            localNavList: localNavListJson
                .map((e) => CommonModel.fromJson(e))
                .toList(),
            subNavList: subNavListJson
                .map((e) => CommonModel.fromJson(e))
                .toList(),
            girdNav: GridNavModel.fromJson(json['gridNav']),
            salesBox: SalesBoxModel.fromJson(json['salesBox']),
          )
        : null;
  }
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['config'] = config.toJson();
    data['bannerList'] = bannerList.map((e)=>e.toJson()).toList();
    data['localNavList'] = localNavList.map((e)=>e.toJson()).toList();
    data['girdNav'] = girdNav.toJson();
    data['subNavList'] = subNavList.map((e)=> e.toJson()).toList();
    data['salesBox'] = salesBox.toJson();
    return data;
  }

}
