import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:conflix/models/items.dart';

class BaseApi {
  static Dio dio = Dio();

  static var queryparameter = {'api_key': '45a7134d61b082ded030355d36218ca4'};
  static String baseApi = 'https://api.themoviedb.org/3';

  static String apiRequestToken = '$baseApi/authentication/token/new';

  static String popularMovies = 'https://api.themoviedb.org/3/movie/popular';
  static String topRatedMovies = 'https://api.themoviedb.org/3/movie/top_rated';
  static String popularTv = 'https://api.themoviedb.org/3/tv/popular';
  static String topRatedTv = 'https://api.themoviedb.org/3/tv/top_rated';
  static String detailMovie = 'https://api.themoviedb.org/3/movie/';
  static String detailTv = 'https://api.themoviedb.org/3/tv/';
  static String searchMovie = 'https://api.themoviedb.org/3/search/movie/';
  static String searchTv = 'https://api.themoviedb.org/3/search/tv/';

  static String popularMoviesTitle = 'Popular Movies';
  static String topRatedMoviesTitle = 'Top Rated Movies';
  static String popularTvTitle = 'Popular TV Shows';
  static String topRatedTvTitle = 'Top Rated TV Shows';

  static String getContent(String content) {
    if (content == popularMoviesTitle) {
      return popularMovies;
    } else if (content == topRatedMoviesTitle) {
      return topRatedMovies;
    } else if (content == popularTvTitle) {
      return popularTv;
    } else if (content == topRatedTvTitle) {
      return topRatedTv;
    } else {
      return '';
    }
  }

  static String getContentDetail(String content) {
    if ([popularMoviesTitle, topRatedMoviesTitle, 'movie'].contains(content)) {
      return detailMovie;
    } else if ([popularTvTitle, topRatedTvTitle, 'tv'].contains(content)) {
      return detailTv;
    } else {
      return '';
    }
  }

  static String getContentSearch(String content) {
    if ('movie'.contains(content)) {
      return searchMovie;
    } else if ('tv'.contains(content)) {
      return searchTv;
    } else {
      return '';
    }
  }

  static Future<Data?> getData(var content) async {
    try {
      var response = await dio.get(
        getContent(content),
        queryParameters: queryparameter,
      );

      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var list = Data.fromJson(response.data);
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Future<dynamic> getDetail(int id, String content) async {
    try {
      var response = await dio.get(
        '${getContentDetail(content)}$id',
        queryParameters: queryparameter,
      );

      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var list = response.data;
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Future<Data?> searchData(String query, String content) async {
    try {
      var response = await dio.get(
        '${getContentSearch(content)}?query=$query',
        queryParameters: queryparameter,
      );

      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        // var list = response.data;
        var list = Data.fromJson(response.data);
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  static Future<dynamic> requestToken(String query, String content) async {
    try {
      var response = await dio.get(
        apiRequestToken,
        queryParameters: queryparameter,
      );

      if (kDebugMode) {
        print('Status Code : ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var list = response.data;
        return list;
      } else {
        return null;
      }
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
