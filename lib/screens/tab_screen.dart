import 'package:flutter/material.dart';
import 'package:newsapp/screens/widgets/card_widget.dart';
import 'package:newsapp/screens/widgets/tab_widget.dart';
import 'home_cubit/cubit.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
              length: HomeCubit.get(context).sources.length,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (value) {
                    HomeCubit.get(context).changeSource(value);
                  },
                  tabs: HomeCubit.get(context).sources.map((e) {
                    return TabWidget(
                        e.name ?? '',
                        HomeCubit.get(context).sources.indexOf(e) ==
                            HomeCubit.get(context).ind);
                  }).toList())),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return CardWidget(
                      HomeCubit.get(context).articles[index],
                      HomeCubit.get(context)
                              .sources[HomeCubit.get(context).ind]
                              .name ??
                          '');
                },
                itemCount: HomeCubit.get(context).articles.length),
          )
        ],
      ),
    );
  }
}
