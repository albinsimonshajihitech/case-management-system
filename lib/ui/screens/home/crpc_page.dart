import 'package:flutter/material.dart';
import 'package:case_management_system/models/crpc_form_entity.dart';
import 'package:case_management_system/providers/sheets/google_sheets_provider.dart';
import 'package:case_management_system/ui/app.dart';

class CrpcPage extends StatefulWidget {
  final GoogleSheetsProvider providing;
  const CrpcPage({
    required this.providing,
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CrpcPage> {
  Future<List<CrpcEntity>> get Crpc => widget.providing.getCrpcform();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crpc Forms'),
      ),
      body: FutureBuilder<List<CrpcEntity>>(
        future: Crpc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final crpc = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
                itemCount: crpc.length,
                itemBuilder: (context, index) => CrpcForm(
                  court_name: crpc[index].court_name,
                  case_type: crpc[index].case_type,
                  case_no: crpc[index].case_no,
                  case_year: crpc[index].case_year,
                  petitioner_name: crpc[index].petitioner_name,
                  petitioner_paternal_title: crpc[index].petitioner_paternal_title,
                  petitioner_paternal_name: crpc[index].petitioner_paternal_name,
                  petitioner_address: crpc[index].petitioner_address,
                  respondent_name: crpc[index].respondent_name,
                  respondent_address: crpc[index].respondent_address,
                  date: crpc[index].date,
                  onDelete: () async {
                    await widget.providing.deleteCrpc(index);

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

class CrpcForm extends StatelessWidget {
  final String court_name;
  final String case_type;
  final String case_no;
  final String case_year;
  final String petitioner_name;
  final String petitioner_paternal_title;
  final String petitioner_paternal_name;
  final String petitioner_address;
  final String respondent_name;
  final String respondent_address;
  final String date;
  final VoidCallback onDelete;

  const CrpcForm({
    required this.court_name,
    required this.case_no,
    required this.case_type,
    required this.case_year,
    required this.petitioner_name,
    required this.petitioner_paternal_title,
    required this.petitioner_paternal_name,
    required this.petitioner_address,
    required this.respondent_name,
    required this.respondent_address,
    required this.date,
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
                    date,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(date, textAlign: TextAlign.start),
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
