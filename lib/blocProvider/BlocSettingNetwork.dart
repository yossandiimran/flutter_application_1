import 'dart:convert';
import 'package:flutter_application_1/model/SettingNetworkModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSettingNetwork extends Bloc<String, SettingNetworkModel> {
  BlocSettingNetwork() : super(json.decode("{data:0}"));

  var lm;

  @override
  Stream<SettingNetworkModel> mapEventToState(event) async* {
    yield lm = SettingNetworkModel.fromJson(json.decode(""));
  }
}
