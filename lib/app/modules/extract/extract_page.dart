import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'extract_controller.dart';

class ExtractPage extends StatelessWidget {
  final controller = Get.put(ExtractController());

  ExtractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transações"),
        ),
        body: Obx(() {
          var transactions = controller.transactions;
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(8),
              controller: controller.scrollController,
              itemCount: transactions.length + 1,
              itemBuilder: (_, index) {
                return index == transactions.length
                    ? LinearProgressIndicator()
                    : ListTile(
                        leading: transactions[index].tipoLancamento == "D"
                            ? Icon(Icons.trending_down, color: Colors.red)
                            : Icon(
                                Icons.trending_up,
                                color: Colors.green,
                              ),
                        title: Text(transactions[index].descricaoOperacao),
                        subtitle: Text(DateFormat("dd/MM/y").format(
                            DateTime.parse(transactions[index].dataMovimento))),
                        trailing: Text(
                          NumberFormat.currency(locale: "pt", symbol: "R\$")
                              .format(transactions[index].valorMovimento),
                          style: TextStyle(
                              color: transactions[index].tipoLancamento == "D"
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      );
              });
        }));
  }
}
