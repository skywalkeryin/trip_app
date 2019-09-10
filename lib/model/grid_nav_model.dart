import 'package:trip_app/model/grid_nav_item.dart';

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json){
    return json != null ?
        GridNavModel(
          hotel: GridNavItem.fromJson(json['hotel']),
          flight: GridNavItem.fromJson(json['flight']),
          travel: GridNavItem.fromJson(json['travel']),
        ):null;
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel'] =  hotel.toJson();
    data['flight'] = flight.toJson();
    data['travel'] = travel.toJson();
    return data;
  }
}
