import 'package:flutter/material.dart';
import 'package:newsapp/screens/widgets/card_widget.dart';
import 'package:newsapp/screens/widgets/tab_widget.dart';
import 'package:newsapp/shared/remote/api_manager.dart';

import '../Models/sources_model.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.sources});

 final List<Sources> sources;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
              length: widget.sources.length,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (value) {
                    ind = value;
                    setState(() {});
                  },
                  tabs: widget.sources.map((e) {
                    return TabWidget(
                        e.name ?? '', widget.sources.indexOf(e) == ind);
                  }).toList())),
          FutureBuilder(
            future: ApiManager.getNews(widget.sources[ind].id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text(
                  "some thing wrong",
                  style: TextStyle(color: Colors.red, fontSize: 100),
                );
              }
              var dataNews = snapshot.data?.articles ??[];
              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                     return CardDetails(dataNews[index],widget.sources[ind].name??'');
                    },
                    itemCount: dataNews.length),
              );
            },
          )
        ],
      ),
    );
  }
}
