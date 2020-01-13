import 'package:flutter/material.dart';

import 'package:rss_feed/page/listNews.dart';

void main() => runApp(RSSReader());

class RSSReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Reader',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String title = "RSS Reader";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 40),
          child: TextField(
            style: TextStyle(color: Colors.black, fontSize: 24),
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              hintText: "URL",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onSubmitted: (String url){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListNews(url: url,)));
              });
            },
          ),
        ),
      ),
    );
  }
}
