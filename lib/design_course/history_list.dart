import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryList createState() => new _HistoryList();
}

class _InvoiceAll{
  final String game_name;
  final String voucher_name;
  final String account_id;
  final String paypal_account;
  final String created_at;

  _InvoiceAll(this.game_name, this.voucher_name, this.account_id, this.paypal_account, this.created_at);
}

class _HistoryList extends State<HistoryList> {

  Future<List<_InvoiceAll>> _getInvoiceALl() async {
    var data = await http.get("https://gamevofinal0813.000webhostapp.com/invoices");

    var dataToJSON = json.decode(data.body);

    List<_InvoiceAll> invoiceAll2 = [];

    for (var u in dataToJSON){
      _InvoiceAll invoice = _InvoiceAll(
        u["game_name"], 
        u["voucher_name"], 
        u["account_id"], 
        u["paypal_account"], 
        u["created_at"]
      );
      invoiceAll2.add(invoice);
    } 
    print(invoiceAll2.length);
    return invoiceAll2;
  } 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: const Text('Invoice'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getInvoiceALl(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(
                      "Invoice at : "+snapshot. data[index].created_at
                    ),
                    subtitle: Text(
                      "Account ID : " + snapshot. data[index].account_id + "\n" + 
                      "Game : " + snapshot. data[index].game_name + "\n" + 
                      "Voucher : " + snapshot. data[index].voucher_name
                    ),
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}