// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ContainerSideRight extends StatelessWidget {
  final String tableName;
  final int tableId;
  final String status;
  const ContainerSideRight({
    Key? key,
    required this.tableName,
    required this.tableId,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
              )
            ]),
        child: Center(
            child: Column(
          children: [
            Text(
              tableName,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Status : '), Text(status)]),
            const SizedBox(height: 40),
            dynamicSectionForButtonOrder(tableId, status, context),
          ],
        )));
  }

  Column dynamicSectionForButtonOrder(
      int id, String status, BuildContext context) {
    if (status == 'seated') {
      return Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // context.go('${OrderPage.routeName}/$id');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text('Add Order')),
        ],
      );
    }
    return Column(
      children: [Container()],
    );
  }
}
