import 'package:dio/dio.dart';

import '../../models/game.dart';
import '../../models/pagination.dart';
import '../configure/http_configuration_provider.dart';
import '../log/custom_logInterceptor.dart';
import 'irepository_game.dart';

class RepositoryGame implements IrepositoryGame {

  @override
  Future<Pagination> getPaginationGames() async {
    // String api = dotenv.get('API_URL');
    HttpConfigurationProvider provider = HttpConfigurationProvider();
    String api = provider.getBaseApiUrl();
    String url = '$api/v1/game';
    print('RepositoryGame > getPaginationGames > url :: $url');
    String apiKey = provider.getApiKey();
    print('RepositoryGame > getPaginationGames > apiKey :: $apiKey');
    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $apiKey';
    Response response = await dio.get(url, queryParameters: {'take': 12, 'pages': 1});
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler) {
        return handler.resolve(Response(requestOptions:options, data:'fake data'));
      },
    ));
    // CustomLog
    dio.interceptors.add(CustomLogInterceptor());
    var pageTotal = response.data['pageTotal'];
    var total = response.data['total'];
    // print('getDeposits > pageTotal :: ' + pageTotal.toString() + " , total : " + total);
    //print('getDeposits > results :: $results');
    List<Game> deposits = (response.data['results'] as List)
        .map((x) => Game.fromJson(x))
        .toList();
    return Pagination(pageTotal: pageTotal, total: total, listItems: deposits);
  }

  @override
  Future<List<Game>> getGames(int take, int page) async {
    // String api = dotenv.get('API_URL');
    HttpConfigurationProvider provider = HttpConfigurationProvider();
    String api = provider.getBaseApiUrl();
    String url = '$api/v1/game';
    print('getDeposits > url :: $url');
    String apiKey = provider.getApiKey();
    print('getDeposits > apiKey :: $apiKey');
    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $apiKey';
    Response response = await dio.get(url, queryParameters: {'take': take, 'pages': page});
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler) {
        return handler.resolve(Response(requestOptions:options, data:'fake data'));
      },
    ));
    // CustomLog
    dio.interceptors.add(CustomLogInterceptor());
    // var pageTotal = response.data['pageTotal'];
    // var total = response.data['total'];
    var results = response.data['results'];
    // print('getDeposits > pageTotal :: ' + pageTotal.toString() + " , total : " + total);
    //print('getDeposits > results :: $results');
    List<Game> deposits = (results as List)
        .map((x) => Game.fromJson(x))
        .toList();
    return deposits;
  }

  @override
  Future createGame(String userId) async {
    // String api = dotenv.get('API_URL');
    HttpConfigurationProvider provider = HttpConfigurationProvider();
    String api = provider.getBaseApiUrl();
    String url = '$api/v1/game';
    print('createDeposit > userId :: $userId');
    // String apiKey = dotenv.get('API_KEY');
    String apiKey = provider.getApiKey();
    print('createDeposit > apiKey :: $apiKey');
    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $apiKey';
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler) async {
          options.headers['Authorization'] = 'Bearer $apiKey';
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (error, handler) {
          print('registerClient > error.message :: ${error.message}');
          return  handler.next(error);
        }
    ));
    dynamic data = { 'userId': userId };
    Response response = await dio.post(url, data: data);
    return Game.fromJson(response.data);
  }

  @override
  Future removeGame(String id) async {
    HttpConfigurationProvider provider = HttpConfigurationProvider();
    String api = provider.getBaseApiUrl();
    String url = '$api/v1/game/admin/$id';
    // String apiKey = dotenv.get('API_KEY');
    String apiKey = provider.getApiKey();
    print('removeGame > apiKey :: $apiKey');
    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $apiKey';
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler) async {
          options.headers['Authorization'] = 'Bearer $apiKey';
          //print('remove request：path:${options.path}，baseURL:${options.baseUrl}');
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (error, handler) {
          print('registerClient > error.message :: ${error.message}');
          return  handler.next(error);
        }
    ));
    Response response = await dio.delete(url);
    print('registerClient > response.statusCode :: ${response.statusCode} , response :: ${response.data.toString()}');
    return response.statusCode;
  }


}