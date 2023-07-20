// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diyo_pos/features/order/presentation/widgets/container_side_right_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diyo_pos/common/app_drawer.dart';
import 'package:diyo_pos/features/order/presentation/bloc/order_menu/order_menu_bloc.dart';

class OrderPage extends StatefulWidget {
  static const routeName = '/order';
  const OrderPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderMenuBloc>().add(LoadMenuData());
    context.read<OrderMenuBloc>().add(GetTableData(id: widget.id));
  }

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
                  child: Center(
                    child: BlocBuilder<OrderMenuBloc, OrderMenuState>(
                      buildWhen: (previous, current) {
                        return previous != current &&
                            current is OrderMenuLoaded;
                      },
                      builder: (context, state) {
                        if (state is OrderMenuLoaded) {
                          return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 30.0,
                                mainAxisSpacing: 30.0,
                              ),
                              itemCount: state.menuList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border.all(
                                            color: Colors.red,
                                          )),
                                      child: Center(
                                          child: Text(
                                        state.menuList[index].name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ))),
                                );
                              });
                        }

                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      },
                    ),
                  )));

          Widget rightColumn = Expanded(
            child: BlocBuilder<OrderMenuBloc, OrderMenuState>(
              buildWhen: (previous, current) {
                return previous != current && current is TableDataLoaded;
              },
              builder: (context, state) {
                if (state is OrderMenuLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  );
                }
                if (state is TableDataLoaded) {
                  return ContainerSideRight(
                    tableName: state.table.name,
                    tableId: state.table.id,
                    status: state.table.status,
                  );
                }
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
                  child: const Center(
                    child: Text('Tap on table to see details'),
                  ),
                );
              },
            ),
          );

          return isWideScreen
              ? Row(children: [leftColumn, rightColumn])
              : Column(children: [leftColumn, rightColumn]);
        })));
  }
}
