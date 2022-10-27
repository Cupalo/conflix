import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/controllers.dart/data_controller.dart';
import 'package:conflix/default/theme.dart';
import 'package:conflix/ui/widget/backdrop_image.dart';
import 'package:conflix/ui/widget/seasons_grid.dart';
import 'package:conflix/ui/widget/table_detail.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({
    Key? key,
    required this.id,
    required this.content,
  }) : super(key: key);
  final int id;
  final String content;
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseTheme.appBar('Detail'),
      body: FutureBuilder<dynamic>(
        future: dataController.getDetail(id, content),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        BackdropImage(
                          imageUrl: 'https://image.tmdb.org/t/p/original'
                              '${snapshot.data['backdrop_path']}',
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Row(
                          children: [
                            SizedBox(width: Get.width * 0.5),
                            Container(
                              padding: EdgeInsets.only(right: Get.width * 0.02),
                              width: Get.width * 0.5,
                              child: Text(snapshot.data['title'] ??
                                  snapshot.data['name'] ??
                                  'error'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: BaseTheme.marginHorizontalLarge,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: Get.width * 0.4),
                              const Icon(Icons.playlist_add),
                              const Icon(Icons.thumb_up),
                              const Icon(Icons.share),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      left: 40,
                      child: Container(
                        height: 140,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.5, 0.5),
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                            )
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/original'
                              '${snapshot.data['poster_path']}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    height: 40,
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_circle_outlined),
                        SizedBox(width: Get.width * 0.02),
                        const Text('Play'),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: BaseTheme.marginAllLarge,
                    width: Get.width * 0.8,
                    child: Text(
                      snapshot.data['overview'],
                      style: TextStyle(
                        fontSize: BaseTheme.fontSizeSmall,
                      ),
                    ),
                  ),
                ),
                TableDetail(item: snapshot.data),
                snapshot.data['seasons'] == null
                    ? Container()
                    : Seasons(seasons: snapshot.data['seasons'])
              ],
            );
          } else {
            return Center(
              child: BaseTheme.loading(),
            );
          }
        },
      ),
    );
  }
}
