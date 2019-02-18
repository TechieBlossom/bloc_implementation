import 'package:bloc_implementation/bloc/player_listing_bloc.dart';
import 'package:bloc_implementation/bloc/player_listing_events.dart';
import 'package:bloc_implementation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: TextField(
        onChanged: (term) {
          BlocProvider.of<PlayerListingBloc>(context)
              .dispatch(SearchTextChangedEvent(searchTerm: term));
        },
        style: searchTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          hintStyle: hintStyle,
          hintText: 'Search for a player',
          prefixIcon: Icon(
            Icons.person,
            size: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
