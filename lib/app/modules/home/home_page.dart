import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/config/paths.dart';
import 'package:marvel_characters/app/modules/home/home_status.dart';
import 'package:marvel_characters/app/modules/home/home_store.dart';
import 'package:marvel_characters/app/modules/model/character.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Image.asset(
          Paths.logo,
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (controller.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          } else if (controller.status == HomeStatus.success) {
            final list = controller.status.value as List<CharacterModel>;

            if (list.isNotEmpty) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  CharacterModel character = list[index];
                  return ListTile(
                    title: Text(character.name),
                    leading: Image.network(
                      "${character.thumbnail.path}.${character.thumbnail.extension}",
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Lista Vazia'),
              );
            }
          } else if (controller.status == HomeStatus.error) {
            return Center(
              child: Text('${controller.status.value}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
