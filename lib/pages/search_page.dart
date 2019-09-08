import 'package:flutter/material.dart';

List<String> cityNames = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView(
        controller: _scrollController,
        children: _bulidList(),
      ),
    ));
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  _loadData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }
}

List<Widget> _bulidList() {
  return cityNames.map((city) => _item(city)).toList();
}

Widget _item(String city) {
  return Container(
    height: 80,
    margin: EdgeInsets.only(bottom: 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.teal),
    child: Text(
      city,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
