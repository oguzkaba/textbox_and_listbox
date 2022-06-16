import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import 'widgets/change_bgcolor_widget.dart';
import 'widgets/move_between_lists.dart';
import 'widgets/sort_character_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Test App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SortedCharacterWidget(myProvider: myProvider),
                const Divider(color: Colors.black),
                MoveBetweenListsWidget(
                    size: MediaQuery.of(context).size, myProvider: myProvider),
                const Divider(color: Colors.black),
                ChangeBGColorWidget(myProvider: myProvider)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
