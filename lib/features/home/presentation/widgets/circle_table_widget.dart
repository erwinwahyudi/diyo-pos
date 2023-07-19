// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleTable extends StatefulWidget {
  final String status;
  final String name;
  const CircleTable({
    Key? key,
    required this.status,
    required this.name,
  }) : super(key: key);

  @override
  State<CircleTable> createState() => _CircleTableState();
}

class _CircleTableState extends State<CircleTable> {
  @override
  Widget build(BuildContext context) {
    Color fontColor = Colors.black;
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.red;

    if (widget.status == 'available') {
      fontColor = Colors.red;
      backgroundColor = Colors.white;
      borderColor = Colors.red;
    } else if (widget.status == 'seated') {
      fontColor = Colors.white;
      backgroundColor = Colors.red;
      borderColor = Colors.red;
    } else if (widget.status == 'ordered') {
      fontColor = Colors.black;
      backgroundColor = Colors.yellow;
      borderColor = Colors.yellow;
    } else if (widget.status == 'billing') {
      fontColor = Colors.white;
      backgroundColor = Colors.blue;
      borderColor = Colors.blue;
    } else {
      fontColor = Colors.white;
      backgroundColor = Colors.grey;
      borderColor = Colors.black;
    }

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
          child: Text(
        widget.name,
        style: TextStyle(color: fontColor),
      )),
    );
  }
}
