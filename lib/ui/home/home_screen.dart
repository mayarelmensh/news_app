import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/category/category_details.dart';
import 'package:news/ui/drawer/drawer_home.dart';
import 'package:news/ui/home/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
          ],
          title: Text(
            selectedCategory == null ? 'Home' : selectedCategory!.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: DrawerHome(drawerOnClicked: drawerOnClicked),
        ),
        body: selectedCategory == null
            ? CategoryFragment(onViewAllClicked: onViewAllClicked)
            : CategoryDetails(
                category: selectedCategory!,
              ));
  }

  CategoryModel? selectedCategory;

  //to store user's choice
  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  drawerOnClicked() {
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }
}
