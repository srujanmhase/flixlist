import 'package:flixlist/home/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //int _selectedIndex = 0;
  late TabController _tabController;
  void _onItemTapped(int page) {
    _tabController.animateTo(page);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _tabController,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeView(),
            Text('world'),
          ],
        ),
        bottomNavigationBar: Builder(builder: (context) {
          return Consumer<TabController>(
            builder: (context, value, child) => BottomNavigationBar(
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation),
                  label: 'Explore',
                ),
              ],
              currentIndex: value.index,
              selectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),
          );
        }),
      ),
    );
  }
}
