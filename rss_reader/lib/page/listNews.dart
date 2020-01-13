import 'package:flutter/material.dart';
import 'package:rss_feed/db_helper/GetRss.dart';

import 'newsDetails.dart';

class ListNews extends StatefulWidget {
  ListNews({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _ListNews createState() => _ListNews();
}

class _ListNews extends State<ListNews> {

  String title = "RSS Reader";

  @override
  Widget build(BuildContext context) {
    setState(() {
      GetRss.getRss(widget.url);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),

      body: Center(
        child: FutureBuilder(
            future: GetRss.getRss(widget.url),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
                          child: Icon(Icons.signal_wifi_off, size: 60, color: Colors.orangeAccent,),
                        ),
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
                          child: Icon(Icons.cloud_download, size: 60, color: Colors.orangeAccent,),
                        ),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  return Container(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          String url;
                          if (snapshot.data[index].urlImage != "") {
                            url = snapshot.data[index].urlImage;
                          } else {
                            url = "https://dx-world.net/wp-content/uploads/2017/10/no-news-good-news.png";
                          }
                          return ListTile(
                            leading: Image.network(url),
                            title: Text(snapshot.data[index].title,
                              style: TextStyle(fontSize: 15, color: Colors.black),),
                            subtitle: Text(snapshot.data[index].date,
                              style: TextStyle(fontSize: 15, color: Colors.black),),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    NewsDetails(
                                      title: "Post",
                                      url: snapshot.data[index].urlPost,
                                      key: null,
                                    ),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(
                              color: Colors.black,
                            ),
                        itemCount: snapshot.data.length
                    ),
                  );
                  break;
              }
            }),
      ),
    );
  }
}