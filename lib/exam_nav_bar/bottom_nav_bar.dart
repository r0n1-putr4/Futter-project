import 'package:flutter/material.dart';
import 'package:roni/exam_nav_bar/custome_grid.dart';
import 'package:roni/exam_nav_bar/form_register.dart';
import 'package:roni/exam_nav_bar/search_list.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Bar")),
      body: TabBarView(
        controller: tabController,
        children: [FormRegister(), CustomeGrid(), SearchList()],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "Form Register", icon: Icon(Icons.input)),
            Tab(text: "Costume Grid", icon: Icon(Icons.grid_on)),
            Tab(text: "Search List", icon: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
