import 'package:bloc_implementation/search_configuration.dart';
import 'package:bloc_implementation/themes/themes.dart';
import 'package:flutter/material.dart';

class AdvancedSearchPage extends StatefulWidget {
  final SearchConfiguration searchConfiguration;

  AdvancedSearchPage({this.searchConfiguration});

  @override
  _AdvancedSearchPageState createState() => _AdvancedSearchPageState();
}

class _AdvancedSearchPageState extends State<AdvancedSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced Search"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text("POSITIONS", style: titleStyle.copyWith(fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (var positionName in widget.searchConfiguration.positions)
                      ChoiceChip(
                          selected: widget.searchConfiguration.selectedPositions.contains(positionName),
                          selectedColor: Colors.blueGrey,
                          backgroundColor: Colors.grey.shade200,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                          labelStyle: widget.searchConfiguration.selectedPositions.contains(positionName)
                              ? choiceTextStyle.copyWith(color: Colors.white)
                              : choiceTextStyle,
                          label: Text(positionName),
                          onSelected: (isSelected) {
                            setState(() {
                              _onPositionSelected(isSelected, positionName);
                            });
                          }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text("LEAGUES", style: titleStyle.copyWith(fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (var leagueKey in widget.searchConfiguration.leagues.keys)
                      ChoiceChip(
                          selected: widget.searchConfiguration.selectedLeagues.keys.contains(leagueKey),
                          selectedColor: Colors.blueGrey,
                          backgroundColor: Colors.grey.shade200,
                          pressElevation: 10,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                          labelStyle: widget.searchConfiguration.selectedLeagues.keys.contains(leagueKey)
                              ? choiceTextStyle.copyWith(color: Colors.white)
                              : choiceTextStyle,
                          label: Text(leagueKey),
                          onSelected: (isSelected) {
                            setState(() {
                              _onLeagueSelected(isSelected, leagueKey);
                            });
                          }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text("NATIONS", style: titleStyle.copyWith(fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (var nationKey in widget.searchConfiguration.nations.keys)
                      ChoiceChip(
                          selected: widget.searchConfiguration.selectedNations.keys.contains(nationKey),
                          selectedColor: Colors.blueGrey,
                          backgroundColor: Colors.grey.shade200,
                          pressElevation: 10,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                          labelStyle: widget.searchConfiguration.selectedNations.keys.contains(nationKey)
                              ? choiceTextStyle.copyWith(color: Colors.white)
                              : choiceTextStyle,
                          label: Text(nationKey),
                          onSelected: (isSelected) {
                            setState(() {
                              _onNationSelected(isSelected, nationKey);
                            });
                          }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                    color: Colors.blueGrey,
                    highlightElevation: 4,
                    onPressed: () {
                      Navigator.of(context).pop({"search_configuration": widget.searchConfiguration});
                    },
                    child: Text(
                      "Done",
                      style: messageTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPositionSelected(bool isSelected, String position) {
    isSelected
        ? widget.searchConfiguration.selectedPositions.add(position)
        : widget.searchConfiguration.selectedPositions.remove(position);

    print(widget.searchConfiguration.selectedPositions);
  }

  void _onLeagueSelected(bool isSelected, String leagueKey) {
    isSelected
        ? widget.searchConfiguration.selectedLeagues
            .putIfAbsent(leagueKey, () => widget.searchConfiguration.leagues[leagueKey])
        : widget.searchConfiguration.selectedLeagues.remove(leagueKey);

    print(widget.searchConfiguration.selectedLeagues);
  }

  void _onNationSelected(bool isSelected, String nationKey) {
    isSelected
        ? widget.searchConfiguration.selectedNations
            .putIfAbsent(nationKey, () => widget.searchConfiguration.nations[nationKey])
        : widget.searchConfiguration.selectedNations.remove(nationKey);

    print(widget.searchConfiguration.selectedNations);
  }
}
