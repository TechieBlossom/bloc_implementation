import 'package:bloc/bloc.dart';
import 'package:bloc_implementation/bloc/player_listing_events.dart';
import 'package:bloc_implementation/bloc/player_listing_states.dart';
import 'package:bloc_implementation/models/api_models.dart';
import 'package:bloc_implementation/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  /*@override
  Stream<PlayerListingEvent> transform(Stream<PlayerListingEvent> events) {
    return (events as PublishSubject<PlayerListingEvent>)
        .transform(DebounceStreamTransformer(Duration(milliseconds: 250)));
  }*/

  @override
  Stream<PlayerListingState> transform(Stream<PlayerListingEvent> events, Stream<PlayerListingState> Function(PlayerListingEvent event) next) {
    return super.transform((events as PublishSubject<PlayerListingEvent>)
        .debounceTime(Duration(milliseconds: 1000)), next);
  }

  @override
  void onTransition(Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    print("mapEventToState");
    yield PlayerFetchingState();
    try {
      List<Players> players;
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      } else if(event is AdvanceSearchChangeEvent) {
        players = await playerRepository.fetchPlayersSearchConfiguration(event.searchConfiguration);
      }
      if (players.length == 0) {
        yield PlayerEmptyState();
      } else {
        yield PlayerFetchedState(players: players);
      }
    } catch (_) {
      yield PlayerErrorState();
    }
  }


  /*@override
  Stream<PlayerListingState> mapEventToState(
      PlayerListingState currentState, PlayerListingEvent event) async* {
    print("mapEventToState");
    yield PlayerFetchingState();
    try {
      List<Players> players;
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        print("hitting service");
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      }
      if (players.length == 0) {
        yield PlayerEmptyState();
      } else {
        yield PlayerFetchedState(players: players);
      }
    } catch (_) {
      yield PlayerErrorState();
    }
  }*/
}
