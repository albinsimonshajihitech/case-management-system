import 'package:case_management_system/model/user_form.dart';
import 'package:flutter/material.dart';

import 'controller/user_form_controller.dart';

class UserdetailListScreen extends StatelessWidget {
  const UserdetailListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'User Detail Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserdetailListPage(title: "Responses", key: UniqueKey(),));
  }
}

class UserdetailListPage extends StatefulWidget {
  const UserdetailListPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _UserdetailListPageState createState() => _UserdetailListPageState();
}

class _UserdetailListPageState extends State<UserdetailListPage> {
  List<UserdetailForm> userdetailItems = List<UserdetailForm>.empty();

  // Method to Submit Userdetail and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getUserdetailList().then((userdetailItems) {
      setState(() {
        this.userdetailItems = userdetailItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: userdetailItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                const Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${userdetailItems[index].name} (${userdetailItems[index].age})"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                const Icon(Icons.message),
                Expanded(
                  child: Text(userdetailItems[index].email),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
