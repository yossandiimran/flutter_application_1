import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocProvider/BlocSettingNetwork.dart';
import 'package:flutter_application_1/blocProvider/TestBlocController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helper/Global.dart';
import 'package:http/http.dart' as http;

//Service Controller
part 'service/LoginService.dart';

//Model
part 'model/LoginModel.dart';

//View
part 'view/MenuPage.dart';
part 'view/IntroPage.dart';
part 'view/Home.dart';
part 'view/Login.dart';
part 'view/testBloc.dart';
part 'view/setting/SettingNetwork.dart';
