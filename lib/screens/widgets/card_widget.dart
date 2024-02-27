import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/card_details.dart';
import '../../Models/NewsModel.dart';

class CardWidget extends StatelessWidget {
  CardWidget(this.article, this.name, {super.key});

  Articles article;
  String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CardDetails.routeName, arguments: article);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              height: 150,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(article.title ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              article.description ?? '',
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(article.publishedAt ?? '')
          ],
        ),
      ),
    );
  }
}
