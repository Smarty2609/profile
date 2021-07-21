import 'package:demo/Loans/loandata.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Loan extends StatefulWidget {
  const Loan({Key? key}) : super(key: key);

  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  List<Loans> _loandata = List<Loans>.empty(growable: (true));
  Future<List<Loans>> fetchData() async {
    var response = await http
        .get(Uri.parse("http://app.aoipl.com/api/loan/?id=450&Dbname=aastha"));
    if (response.statusCode == 200) {
      print(response.body);
      var jsondata = jsonDecode(response.body);
      print('fsdfds');
      //  Map<String, dynamic> _loandata;
      _loandata.add(Loans.fromJson(jsondata));
    }
    print(_loandata);
    return _loandata;
  }

  @override
  void initState() {
    setState(() {
      fetchData().then((value) => _loandata.addAll(value));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
