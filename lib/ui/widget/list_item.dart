import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/controllers.dart/data_controller.dart';
import 'package:conflix/models/items.dart';
import 'package:conflix/ui/widget/card_item.dart';

import '../../default/theme.dart';

class ListHome extends StatelessWidget {
  ListHome({
    Key? key,
    required this.title,
    // required this.function,
  }) : super(key: key);

  final String title;
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data?>(
      future: dataController.getData(title),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                padding: BaseTheme.marginHorizontal,
                width: Get.width,
                child: Text(title),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  padding: BaseTheme.marginHorizontalSmall,
                  itemCount: snapshot.data!.results?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = snapshot.data!.results![index];
                    return CardItem(
                      title: title,
                      item: item,
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            height: Get.height * 0.8,
            width: Get.width,
            child: Center(
              child: BaseTheme.loading(),
            ),
          );
        }
      },
    );
  }
}
