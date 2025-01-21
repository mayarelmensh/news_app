import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/ui/category/source_name_item.dart';
import 'package:news/ui/home/news/new_widget.dart';
import '../../model/sourceResponse.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList = [];

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).indicatorColor,
              isScrollable: true,
              tabs: widget.sourcesList.map((source) {
                return SourceNameItem(
                  source: source,
                  isSelected:
                      selectedIndex == widget.sourcesList.indexOf(source),
                );
              }).toList(),
            ),
            Expanded(
                child: NewWidget(
              source: widget.sourcesList[selectedIndex],
            ))
          ],
        ));
  }
}
