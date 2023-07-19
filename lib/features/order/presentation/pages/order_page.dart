import 'package:diyo_pos/common/app_drawer.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  static const routeName = '/order';
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DIYO'),
        ),
        drawer: const AppDrawer(),
        body: LayoutBuilder(builder: ((context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          Widget leftColumn = Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Center(
                    child: Text('Order'),
                  )));

          Widget rightColumn = Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Center(
                    child: Text('Order'),
                  )));

          return isWideScreen
              ? Row(children: [leftColumn, rightColumn])
              : Column(children: [leftColumn, rightColumn]);
        })));
  }
}
