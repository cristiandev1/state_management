import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management/models/user_info_model.dart';
import 'package:state_management/screens/state_management/home_event.dart';
import 'package:state_management/screens/state_management/home_event_notifier.dart';
import 'package:state_management/screens/state_management/home_state.dart';
import 'package:state_management/screens/state_management/home_state_notifier.dart';

class HomeNotifier extends ChangeNotifier {
  HomeNotifier();

  List<UserInfoModel> listUsers = [];
  HomeEventNotifier eventNotifier = HomeEventNotifier.instance;
  HomeStateNotifier stateNotifier = HomeStateNotifier.instance;

  void listenEvents() {
    eventNotifier.addListener(
      () {
        if (eventNotifier.event is HomeEventBuscar) {
          log("buscar usuarios");
          _getUsers();
        } else if (eventNotifier.event is HomeEventAlterarUsuarios) {
          log("refresh usuarios");
          _changeUsers();
        }
      },
    );
  }

  void _getUsers() async {
    await Future.delayed(const Duration(seconds: 2));

    listUsers.addAll([
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Cristian Castro',
          userName: '@cristiandevs1',
          skills: 'Flutter, NodeJs'),
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Pedro Alvares',
          userName: '@pedroAl',
          skills: 'React, Java'),
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Cesar Felipe',
          userName: '@frontDev',
          skills: 'Figma, Html, Css'),
    ]);

    stateNotifier.changeState(HomeStateSuccess());
  }

  void _changeUsers() async {
    listUsers.clear();

    stateNotifier.changeState(HomeStateLoading());

    await Future.delayed(const Duration(seconds: 2));

    listUsers.addAll([
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Chica da silva',
          userName: '@xica',
          skills: 'Android, iOs'),
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Bruna Lima',
          userName: '@bruna_lima',
          skills: 'Php, Laravel'),
      UserInfoModel(
          urlImagem: 'https://avatars.githubusercontent.com/u/33933448?v=4',
          name: 'Antonio Duarte',
          userName: '@antonioDuarteDevsRaroAcademy',
          skills: 'Postman, Opencart, Magento'),
    ]);

    stateNotifier.changeState(HomeStateSuccess());
  }
}
