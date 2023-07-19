import 'package:diyo_pos/common/app_drawer.dart';
import 'package:diyo_pos/features/home/presentation/bloc/detail_table/detail_table_bloc.dart';
import 'package:diyo_pos/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:diyo_pos/features/home/presentation/widgets/circle_table_widget.dart';
import 'package:diyo_pos/features/home/presentation/widgets/container_side_right_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(LoadTableData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DIYO'),
        ),
        drawer: const AppDrawer(),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;

            Widget leftColumn = Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Center(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeTableLoaded) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 30.0,
                              mainAxisSpacing: 30.0,
                            ),
                            itemCount: state.tableList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<DetailTableBloc>()
                                      .add(ShowDetailTable(
                                        id: state.tableList[index].id,
                                      ));
                                },
                                child: CircleTable(
                                    status: state.tableList[index].status,
                                    name: state.tableList[index].name),
                              );
                            });
                      }

                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            );

            Widget rightColumn = Expanded(
              child: BlocBuilder<DetailTableBloc, DetailTableState>(
                builder: (context, state) {
                  if (state is DetailTableLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  }
                  if (state is DetailTableLoaded) {
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
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      leftColumn,
                      rightColumn,
                    ],
                  )
                : Column(
                    children: [
                      leftColumn,
                      rightColumn,
                    ],
                  );
          }),
        ));
  }
}
