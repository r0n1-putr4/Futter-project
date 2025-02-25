import 'package:flutter/material.dart';
import 'komputer.dart' as komputer;
import 'package:roni/screen/exam_nav_route.dart' as navRoute;
import 'package:roni/screen/row_column.dart' as rowColumn;

class TabBarExam extends StatefulWidget {
  const TabBarExam({super.key});

  @override
  State<TabBarExam> createState() => _TabBarExamState();
}

class _TabBarExamState extends State<TabBarExam>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Tab Bar", style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.radio, color: Colors.white)),
            Tab(icon: Icon(Icons.bluetooth)),
            Tab(icon: Icon(Icons.wifi)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          komputer.Komputer(),
          navRoute.NavRoute(),
          rowColumn.ExamRowColumn(),
        ],
      ),
    );
  }
}
