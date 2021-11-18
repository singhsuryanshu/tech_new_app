import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/components/appbar.dart';
import 'package:tech_news_app/components/newsbox.dart';
import 'package:tech_news_app/components/searchbar.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const appbar(),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],
                            imageurl: snapshot.data![index]['urlToImage'] ??
                                Constants.imageurl,
                            title: snapshot.data![index]['title'],
                            description:
                                snapshot.data![index]['description'].toString(),
                            time: snapshot.data![index]['publishedAt'],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.hasError}");
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
