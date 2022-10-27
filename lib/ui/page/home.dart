import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/api/base_api.dart';
import 'package:conflix/controllers.dart/data_controller.dart';
import 'package:conflix/default/theme.dart';
import 'package:conflix/ui/widget/list_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTheme.appBar(
        'CONFLIX',
        textColor: Colors.red,
      ),
      body: SafeArea(
        child: ListView(
          padding: BaseTheme.marginVertical,
          children: [
            ListHome(
              title: BaseApi.popularMoviesTitle,
            ),
            ListHome(
              title: BaseApi.topRatedMoviesTitle,
            ),
            ListHome(
              title: BaseApi.popularTvTitle,
            ),
            ListHome(
              title: BaseApi.topRatedTvTitle,
            ),
          ],
        ),
      ),
    );
  }
}
