import 'package:flutter/material.dart';
import 'package:rss_reader/widgets/cards.dart';
import 'data/rss_feed.dart';


void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

String url = "https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss";

List<Noticia> _feed;

class _MyAppState extends State<MyApp> {

  GlobalKey<RefreshIndicatorState> _refreshKey;

  load() async {
    GetRss.getRss(url).then((result) {
      if (null == result || result.toString().isEmpty) {
        return;
      }
      _feed = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  isFeedEmpty() {
    return null == _feed;
  }

  var currentPage;

  @override
  Widget build(BuildContext context) { 
    load();

    PageController controller = PageController(initialPage: 10);
    
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isFeedEmpty() ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
            key: _refreshKey,
            child: SingleChildScrollView(
             child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 90),
                        child: Text(
                          "RSS READER",
                          style: TextStyle(color: Colors.white, fontSize: 35, ),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150.0),
                  child: Row(
                    children: <Widget>[
                      Text("News",
                          style: TextStyle(
                            color: Color(0xFFff6e6e),
                            fontSize: 30.0,
                            letterSpacing: 1.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 16, 8, 8),
                        child: Text("10", style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage, _feed),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: 10,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 135.0),
                  child: Row(
                    children: <Widget>[
                      Text("Enter URL",
                          style: TextStyle(
                            color: Color(0xFFff6e6e),
                            fontSize: 30.0,
                            letterSpacing: 1.0,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 40),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: "URL",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (String str){
                      setState(() {
                        url = str;
                        load();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          onRefresh: () => load(),
          ),
        ),
      );
  }
}
