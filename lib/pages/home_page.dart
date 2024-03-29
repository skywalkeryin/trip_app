
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trip_app/dao/home_dao.dart';
import 'package:trip_app/model/common_model.dart';
import 'package:trip_app/model/home_model.dart';
import 'package:trip_app/widget/local_nav.dart';

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
  List<CommonModel> localNavList;
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
     try {
      HomeModel home = await HomeDao.fetch();
      setState(() {
         localNavList = home.localNavList;
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
      backgroundColor: Color(0xfff2f2f2),
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
              Padding(
                padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                child: LocalNav(localNavList: localNavList),
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
