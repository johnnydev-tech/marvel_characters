import 'package:marvel_characters/app/modules/home/home_repository.dart';
import 'package:marvel_characters/app/modules/home/home_status.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository repository;

  HomeStoreBase({required this.repository}) {
    fetchChars();
  }

  @observable
  HomeStatus status = HomeStatus.none;

  @action
  Future<void> fetchChars() async {
    status = HomeStatus.loading;
    try {
      final response = await repository.fatchChars();
      status = HomeStatus.success..value = response;
    } catch (e) {
      status = HomeStatus.error..value = e;
    }
  }
}
