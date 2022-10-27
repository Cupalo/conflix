import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/models/items.dart';

import '../../default/theme.dart';
import '../page/item_detail.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.title,
    required this.item,
  }) : super(key: key);
  final String title;
  final Items item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ItemDetail(id: item.id!, content: title),
        );
      },
      child: Column(
        children: [
          Container(
            margin: BaseTheme.marginHorizontalSmall,
            padding: BaseTheme.marginAllSmall,
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/original'
                  '${item.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.trending_up,
                      size: 10,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      item.popularity.toString(),
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate,
                      size: 10,
                      color: Colors.grey,
                    ),
                    Text(
                      item.voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
