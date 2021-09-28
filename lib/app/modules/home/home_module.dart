import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/modules/home/home_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(repository: i.get<HomeRepository>())),
    Bind((i) => HomeRepository(i.get<Dio>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
