import 'package:bloc_implementation/models/api_models.dart';
import 'package:bloc_implementation/search_configuration.dart';
import 'package:bloc_implementation/services/player_api_provider.dart';

class PlayerRepository {
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);

  Future<List<Players>> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);

  fetchPlayersSearchConfiguration(SearchConfiguration searchConfiguration) => _playerApiProvider.fetchPlayersSearchConfiguration(searchConfiguration);
}
