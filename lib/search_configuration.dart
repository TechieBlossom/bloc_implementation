import 'dart:collection';

class SearchConfiguration {
  Map<String, String> selectedLeagues = HashMap(equals: (key1, key2) => key1.compareTo(key2) == 0);
  Map<String, String> selectedNations = HashMap(equals: (key1, key2) => key1.compareTo(key2) == 0);
  List<String> selectedPositions = [];

  List<String> positions = [
    Positions.LF,
    Positions.RF,
    Positions.CF,
    Positions.ST,
    Positions.LM,
    Positions.LW,
    Positions.RM,
    Positions.RW,
    Positions.CAM,
    Positions.CDM,
    Positions.CM,
    Positions.LWB,
    Positions.LB,
    Positions.RB,
    Positions.RWB,
    Positions.CB,
    Positions.GK,
  ];

  Map<String, String> leagues = HashMap()
    ..putIfAbsent("La Liga", () => LeagueCodes.LALIGA)
    ..putIfAbsent("Premier League", () => LeagueCodes.PREMIER_LEAGUE)
    ..putIfAbsent("Ligue 1", () => LeagueCodes.LIGUE1)
    ..putIfAbsent("Icons", () => LeagueCodes.ICONS);

  Map<String, String> nations = HashMap()
    ..putIfAbsent("Argentina", () => NationCodes.ARGENTINA)
    ..putIfAbsent("Brazil", () => NationCodes.BRAZIL)
    ..putIfAbsent("Germany", () => NationCodes.GERMANY)
    ..putIfAbsent("England", () => NationCodes.ENGLAND)
    ..putIfAbsent("France", () => NationCodes.FRANCE)
    ..putIfAbsent("Italy", () => NationCodes.ITALY)
    ..putIfAbsent("Spain", () => NationCodes.SPAIN)
    ..putIfAbsent("Portugal", () => NationCodes.PORTUGAL)
    ..putIfAbsent("Netherlands", () => NationCodes.HOLLAND)
    ..putIfAbsent("Belgium", () => NationCodes.BELGIUM)
    ..putIfAbsent("Croatia", () => NationCodes.CROATIA)
    ..putIfAbsent("Russia", () => NationCodes.RUSSIA);

}

class Positions {
  static const String LF = "LF";
  static const String RF = "RF";
  static const String CF = "CF";
  static const String ST = "ST";
  static const String LM = "LM";
  static const String LW = "LW";
  static const String RM = "RM";
  static const String RW = "RW";
  static const String CAM = "CAM";
  static const String CDM = "CDM";
  static const String CM = "CM";
  static const String LWB = "LWB";
  static const String RWB = "RWB";
  static const String LB = "LB";
  static const String RB = "RB";
  static const String CB = "CB";
  static const String GK = "GK";
}

class LeagueCodes {
  static const String LALIGA = "240,241,243,448,449,450,452,457,461,462,463,467,480,481,483,1853,1860,100888,110062,110839";
  static const String PREMIER_LEAGUE = "1,5,7,9,10,11,13,17,18,19,95,110,144,1795,1796,1799,1808,1939,1943,1961";
  static const String LIGUE1 = "59,62,65,66,69,70,71,72,73,74,76,210,219,224,379,1530,1809,1816,1819,110569";
  static const String ICONS = "112658";
}

class NationCodes {
  static const String ARGENTINA = "52";
  static const String BRAZIL = "54";
  static const String GERMANY = "21";
  static const String ENGLAND = "14";
  static const String FRANCE = "18";
  static const String ITALY = "27";
  static const String SPAIN = "45";
  static const String PORTUGAL = "38";
  static const String HOLLAND = "34";
  static const String BELGIUM = "7";
  static const String CROATIA = "10";
  static const String RUSSIA = "40";
}
