import 'package:get/get.dart';
import 'package:conflix/api/base_api.dart';
import 'package:conflix/models/items.dart';

class DataController extends GetxController {
  var query = ''.obs;
  var content = ''.obs;
  Rx<Data> listitem = Data(page: 1, results: []).obs;
  var searchLoading = false.obs;

  Future<Data?> getData(String content) async {
    var response = await BaseApi.getData(content);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<dynamic> getDetail(int id, String content) async {
    var response = await BaseApi.getDetail(id, content);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Data?> searchData(String query, String content) async {
    searchLoading.value = true;
    var response = await BaseApi.searchData(query, content);

    if (response != null) {
      listitem.value = response;
      searchLoading.value = false;
      return response;
    } else {
      searchLoading.value = false;
      return null;
    }
  }
}
