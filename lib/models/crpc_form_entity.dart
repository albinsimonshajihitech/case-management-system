class CrpcEntity{

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


  CrpcEntity({

  required this.court_name,
  required this.case_type,
  required this.case_no,
  required this.case_year,
  required this.petitioner_name,
  required this.petitioner_paternal_title,
  required this.petitioner_paternal_name,
  required this.petitioner_address,
  required this.respondent_name,
  required this.respondent_address,
  required this.date

});

  factory CrpcEntity.fromSheets(List<String> input) =>
      CrpcEntity(court_name: input[0], case_type: input[1], case_no: input[2], case_year: input[3], petitioner_name: input[4], petitioner_paternal_title: input[5], petitioner_paternal_name: input[6], petitioner_address: input[7], respondent_name: input[8], respondent_address: input[9], date: input[10]);

}