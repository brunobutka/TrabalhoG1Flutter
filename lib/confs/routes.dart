import 'package:trabalho_g1/character_list.dart';
import 'package:trabalho_g1/show_map.dart';

const String HOME_PAGE = '/';
const String SHOW_MAP = '/map';

var routesOfApp = {
  HOME_PAGE: (context) => const ListClasses(),
  SHOW_MAP: (context) => const NewClass(),
};