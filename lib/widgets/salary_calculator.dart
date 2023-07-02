import 'package:flutter/material.dart';

class SalaryCalaculatorContainer extends StatefulWidget {
  final Color backgroundColor;
  final Widget childWidget;
  final double widgetHeight;

  const SalaryCalaculatorContainer(
      {super.key,
      required this.backgroundColor,
      required this.childWidget,
      required this.widgetHeight});

  @override
  State<SalaryCalaculatorContainer> createState() =>
      _SalaryCalaculatorContainerState();
}

class _SalaryCalaculatorContainerState
    extends State<SalaryCalaculatorContainer> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: widget.widgetHeight,
      width: width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: widget.childWidget,
    );
  }
}
