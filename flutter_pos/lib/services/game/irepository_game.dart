import '../../models/pagination.dart';

abstract class IrepositoryGame {
  Future<List<dynamic>> getGames(int take, int page);
  Future<Pagination> getPaginationGames();
  Future<dynamic> createGame(String userId,);
  Future<dynamic> removeGame(String id,);
}