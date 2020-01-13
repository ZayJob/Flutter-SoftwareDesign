import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:rss_feed/modal_class/news.dart';
import 'package:rss_feed/db_helper/db_helper.dart';

class GetRss {

  static Future<List<News>> getRss(url) async {
    DatabaseHelper databaseHelper = new DatabaseHelper();

    Future<List<News>> noticias;

    var rssFeed;
    var data;

    try{
      data = await http.get(
          url,
          headers: {
            "Content-Type": "application/json"
          });

      rssFeed = new RssFeed.parse(data.body.toString());

      for (int i = 0; i < rssFeed.items.length; i++) {
        databaseHelper.insertNews(new News(rssFeed.items[i].title, rssFeed.items[i].description, rssFeed.items[i].pubDate,
            rssFeed.items[i].enclosure.url, rssFeed.items[i].link));
      }

      noticias = databaseHelper.getNewsList();

    } catch(Exception){
      noticias = databaseHelper.getNewsList();
    }

    return noticias;
  }
}