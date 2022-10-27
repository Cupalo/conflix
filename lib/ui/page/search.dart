import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/controllers.dart/data_controller.dart';
import 'package:conflix/default/theme.dart';
import 'package:conflix/ui/widget/card_item.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            const SizedBox(height: kToolbarHeight),
            const Text('Search'),
            Container(
              margin: BaseTheme.marginHorizontal,
              padding: BaseTheme.marginAll,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black26,
              ),
              child: Container(
                padding: BaseTheme.marginAll,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                  // color: Colors.black26,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: dataController.query.value,
                        onChanged: (value) {
                          dataController.query.value = value;
                        },
                        cursorColor: Colors.red,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        dataController.searchData(
                          dataController.query.value,
                          dataController.content.value,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      activeColor: Colors.red,
                      value: 'movie',
                      groupValue: dataController.content.value,
                      onChanged: (String? value) {
                        dataController.content.value = value!;
                      },
                    ),
                    const Text('Movies')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      activeColor: Colors.red,
                      value: 'tv',
                      groupValue: dataController.content.value,
                      onChanged: (String? value) {
                        dataController.content.value = value!;
                      },
                    ),
                    const Text('TV Shows')
                  ],
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  dataController.listitem.value.results != null
                      ? GridView.builder(
                          itemCount:
                              dataController.listitem.value.results!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 170,
                          ),
                          itemBuilder: (context, index) {
                            var item =
                                dataController.listitem.value.results![index];
                            return CardItem(
                              title: dataController.content.value,
                              item: item,
                            );
                          })
                      : Container(),
                  dataController.searchLoading.isTrue
                      ? Center(
                          child: BaseTheme.loading(),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
