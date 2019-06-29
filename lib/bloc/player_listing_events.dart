import 'package:bloc_implementation/models/nation.dart';
import 'package:bloc_implementation/search_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel}) : assert(nationModel != null);
}

class SearchTextChangedEvent extends PlayerListingEvent {
  final String searchTerm;

  SearchTextChangedEvent({this.searchTerm}) : assert(searchTerm != null);
}

class AdvanceSearchChangeEvent extends PlayerListingEvent {
  final SearchConfiguration searchConfiguration;

  AdvanceSearchChangeEvent({@required this.searchConfiguration}) : assert(searchConfiguration != null);
}
