enum HomeStatus { loading, success, error, none }

extension HomeStatusExtention on HomeStatus {
  // ignore: prefer_typing_uninitialized_variables
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
