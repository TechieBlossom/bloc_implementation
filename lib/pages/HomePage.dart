import 'package:bloc_implementation/bloc/player_listing_bloc.dart';
import 'package:bloc_implementation/bloc/player_listing_events.dart';
import 'package:bloc_implementation/pages/player_listing.dart';
import 'package:bloc_implementation/search_configuration.dart';
import 'package:bloc_implementation/services/repository.dart';
import 'package:bloc_implementation/widgets/horizontal_bar.dart';
import 'package:bloc_implementation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'advanced_search_page.dart';

class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;
  SearchConfiguration _searchConfiguration = SearchConfiguration();

  @override
  void initState() {
    super.initState();
    _playerListingBloc = PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _playerListingBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Advanced Search"),
          icon: Icon(Icons.filter_list),
          onPressed: () async {
            final resultMap = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdvancedSearchPage(
                          searchConfiguration: _searchConfiguration,
                        )));

            print(resultMap);
            _searchConfiguration = resultMap["search_configuration"];
            print(_searchConfiguration);
            _playerListingBloc
                .dispatch(AdvanceSearchChangeEvent(searchConfiguration: _searchConfiguration));
          },
        ),
        appBar: AppBar(
          title: Text(
            'Football Players',
          ),
        ),
        body: Column(
          children: <Widget>[
            HorizontalBar(),
            SizedBox(height: 10.0),
            SearchBar(),
            SizedBox(height: 10.0),
            PlayerListing()
          ],
        ),
      ),
    );
  }
}
