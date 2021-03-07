import 'package:flutter_gofast/src/modules/profile/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/Profile',
      child: (_, args) => ProfilePage(),
    ),
  ];
}
