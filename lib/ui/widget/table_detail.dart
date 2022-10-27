import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../default/theme.dart';

class TableDetail extends StatelessWidget {
  const TableDetail({
    Key? key,
    this.item,
  }) : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: BaseTheme.marginAll,
        width: Get.width * 0.8,
        child: Table(
          // border: TableBorder.all(color: Colors.red),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: table(item),
        ),
      ),
    );
  }

  List<TableRow> table(dynamic item) {
    var genres =
        (List.from(item['genres']).map((e) => e['name']).toList()).join(', ');
    var list = [
      TableRow(
        children: [
          textTable('Title'),
          textTable(item['title'] ?? item['name'] ?? ''),
        ],
      ),
      TableRow(
        children: [
          textTable('Release Date'),
          textTable(item['release_date'] ?? item['first_air_date'] ?? ''),
        ],
      ),
      TableRow(
        children: [
          textTable('Genre'),
          textTable(genres),
        ],
      ),
      TableRow(
        children: [
          textTable('Popularity'),
          textTable(item['popularity'].toString()),
        ],
      ),
      TableRow(
        children: [
          textTable('Rate'),
          textTable(item['vote_average'].toString()),
        ],
      ),
      TableRow(
        children: [
          textTable('Seasons'),
          textTable(item['number_of_seasons'].toString()),
        ],
      ),
      TableRow(
        children: [
          textTable('Episode'),
          textTable(item['number_of_episodes'].toString()),
        ],
      ),
    ];
    if (item['number_of_seasons'] == null ||
        item['number_of_episodes'] == null) {
      return list.getRange(0, 5).toList();
    } else {
      return list.getRange(0, 7).toList();
    }
  }

  Container textTable(String text) {
    return Container(
      padding: BaseTheme.marginHorizontalSmall,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
