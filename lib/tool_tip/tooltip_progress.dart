import 'package:flutter/material.dart';

class ToolTipProgress extends StatelessWidget {
  bool active = false;
  ToolTipProgress({
    required this.active,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height:7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active?Colors.blue:Colors.grey,
      ),
    );
  }
}
class ToolTipProgressListView extends StatefulWidget {
  int select = 0;
  ToolTipProgressListView({super.key,required this.select});

  @override
  State<ToolTipProgressListView> createState() => _ToolTipProgressListViewState();
}


class _ToolTipProgressListViewState extends State<ToolTipProgressListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: 3,
        itemBuilder:(context,index)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: ToolTipProgress(
            active: widget.select==index,
          ),
        ),
      ),
    );
  }
}