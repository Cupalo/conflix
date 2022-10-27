import 'package:flutter/material.dart';

import '../../default/theme.dart';

class Seasons extends StatelessWidget {
  const Seasons({
    Key? key,
    this.seasons,
  }) : super(key: key);
  final dynamic seasons;

  @override
  Widget build(BuildContext context) {
    List<dynamic> listseason = List.from(seasons);
    return Center(
      child: listseason.length < 3
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listseason.map((e) {
                return item(e);
              }).toList(),
            )
          : GridView(
              padding: BaseTheme.marginHorizontalSmall,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
              ),
              children: listseason.map((e) {
                return item(e);
              }).toList(),
            ),
    );
  }

  Widget item(dynamic season) {
    return Column(
      children: [
        Text(
          season['name'],
          style: const TextStyle(
            fontSize: 8,
            color: Colors.grey,
          ),
        ),
        Container(
          margin: BaseTheme.marginAllSmall,
          height: 140,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original'
                '${season['poster_path']}',
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
                  Text(
                    season['air_date'] ?? 'unknown',
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${season['episode_count']} Eps',
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
    );
  }
}
