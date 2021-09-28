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
              return GridView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: .5,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  CharacterModel character = list[index];
                  return SizedBox(
                    width: 180,
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3),
                      ),
                      splashColor: Colors.red.withOpacity(.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${character.thumbnail.path}.${character.thumbnail.extension}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            child: Text(
                              character.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      onTap: () {},
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
