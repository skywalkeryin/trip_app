import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip_app/dao/home_dao.dart';
import 'package:trip_app/model/home_model.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg"
  ];
  double appBarAlpha = 0;
  String resultStr = "";

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  loadData() async {
    // HomeDao.fetch().then((result){
    //   setState(() {
    //    resultStr = json.encode(result);
    //   });
    // })
    // .catchError((e){
    //   setState(() {
    //    resultStr = e.toString();
    //   });
    // });
     try {
      HomeModel home = await HomeDao.fetch();
      setState(() {
        resultStr = json.encode(home);
        print(resultStr);
      });
    } catch (e) {
      setState(() {
        resultStr = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: NotificationListener(
          onNotification: (ScrollNotification) {
            if (ScrollNotification is ScrollUpdateNotification &&
                ScrollNotification.depth == 0) {
              // when the listview scroll
              _onScroll(ScrollNotification.metrics.pixels);
            }
          },
          child: ListView(
            children: <Widget>[
              Container(
                height: 160,
                child: Swiper(
                  itemCount: _imageUrls.length,
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      _imageUrls[index],
                      fit: BoxFit.fill,
                    );
                  },
                  pagination: SwiperPagination(),
                ),
              ),
              Container(
                height: 800,
                child: Text(resultStr),
              )
            ],
          ),
        ),
      ),
      Opacity(
        opacity: appBarAlpha,
        child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("首页"),
              ),
            )),
      )
    ]));
  }
}
