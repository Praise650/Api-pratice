import 'package:http_example_two/src/model.dart';
import 'package:http_example_two/src/network.dart';
import 'package:stacked/stacked.dart';

class DisplayPostViewModel extends BaseViewModel {
  List<Post> posts = [];
  late Post post;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  getData() async {
    setBusy(true);
    loading = true;
    notifyListeners();
    print('hello');
    posts = await Network.getData();
    notifyListeners();
    for (var p in posts) {
      print('world!: ' + p.userId.toString());
      post = p;
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      setBusy(false);
      loading = false;
      notifyListeners();
    });
  }
}
