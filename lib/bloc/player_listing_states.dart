import 'package:bloc_implementation/models/api_models.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingState {}

class PlayerUninitializedState extends PlayerListingState{}

class PlayerFetchingState extends PlayerListingState{}

class PlayerFetchedState extends PlayerListingState{
  final List<Players> players;

  PlayerFetchedState({@required this.players}) : assert (players != null);

}

class PlayerErrorState extends PlayerListingState{}

class PlayerEmptyState extends PlayerListingState{}