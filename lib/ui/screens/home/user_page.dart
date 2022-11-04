import 'package:flutter/material.dart';
import 'package:case_management_system/models/user_entity.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';
import 'package:case_management_system/ui/app.dart';

class HomePage extends StatefulWidget {
  final GoogleSheetsProvider provider;
  const HomePage({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<UserEntity>> get houses => widget.provider.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user details'),
      ),
      body: FutureBuilder<List<UserEntity>>(
        future: houses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(

              child: CircularProgressIndicator(),

            );
          }

          final houses = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) => UserDetail(
                      name: houses[index].name,
                      age: houses[index].age,
                      phone: houses[index].phone,
                      email: houses[index].email,
                      onDelete: () async {
                        await widget.provider.deleteUser(index);

                        /// should call again the getter
                        setState(() {});
                      },
                    )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(routeAdd);
          setState(() {});
        },
        child: const Icon(
          Icons.house,
          color: Colors.white,
        ),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final String name;
  final String age;
  final String phone;
  final String email;
  final VoidCallback onDelete;

  const UserDetail({
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(name, textAlign: TextAlign.start),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey,
                height: 20.0,
                width: 2.0,
              ),
            ),
            Center(
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
