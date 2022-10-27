import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conflix/controllers.dart/navigation_controller.dart';
import 'package:conflix/ui/page/home.dart';
import 'package:conflix/ui/page/search.dart';
import 'package:conflix/ui/page/watch_list.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> listItems = [
    Home(),
    Search(),
    const WatchList(),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          final timegap = DateTime.now().difference(preBackpress);
          final cantExit = timegap >= const Duration(seconds: 2);
          preBackpress = DateTime.now();
          if (cantExit) {
            const snack = GetSnackBar(
              message: 'Press Back button again to Exit',
              duration: Duration(seconds: 2),
              backgroundColor: Colors.black,
            );
            Get.showSnackbar(snack);
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: listItems[navigationController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play),
                label: 'Watch List',
              ),
            ],
            currentIndex: navigationController.currentIndex.value,
            onTap: (value) {
              navigationController.changeIndex(value);
            },
          ),
        ),
      );
    });
  }
}
