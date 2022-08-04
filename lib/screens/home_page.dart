// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:state_management/screens/state_management/home_event.dart';
import 'package:state_management/screens/state_management/home_notifier.dart';
import 'package:state_management/screens/state_management/home_state.dart';
import 'package:state_management/widgets/user_info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeNotifier homeNotifier = HomeNotifier();

  @override
  void initState() {
    homeNotifier.listenEvents();
    homeNotifier.eventNotifier.changeEvent(HomeEventBuscar());
    super.initState();
  }

  @override
  void dispose() {
    homeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerencia de Estado'),
        actions: [
          InkWell(
            onTap: () {
              homeNotifier.eventNotifier
                  .changeEvent(HomeEventAlterarUsuarios());
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: homeNotifier.stateNotifier,
        builder: (context, widget) {
          if (homeNotifier.stateNotifier.state is HomeStateSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeNotifier.listUsers.length,
                      itemBuilder: (context, index) {
                        bool isLast =
                            (homeNotifier.listUsers.length - 1) == index;

                        return UserInfoWidget(
                          urlImagem: homeNotifier.listUsers[index].urlImagem,
                          name: homeNotifier.listUsers[index].name,
                          userName: homeNotifier.listUsers[index].userName,
                          skills: homeNotifier.listUsers[index].skills,
                          isLast: isLast,
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
