import 'package:flutter_bloc/flutter_bloc.dart';

class TestBlocController extends Bloc<String, int> {
  TestBlocController() : super(0);

  int value = 0;

  @override
  Stream<int> mapEventToState(event) async* {
    if (event == "add") {
      value++;
    } else {
      value--;
    }

    yield value;
  }
}
