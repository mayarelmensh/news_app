import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  static const String routeName = 'category_fragment';
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});

  late List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // bool isDark=Theme.of(context)==ThemeMode.dark?true:false;
    categoryList = CategoryModel.getCategoryList(true);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).indicatorColor),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, indexx) {
                return Container(
                  child: Stack(
                    alignment: indexx % 2 == 0
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          categoryList[indexx].image,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03, vertical: height * 0.03),
                        child: ToggleSwitch(
                          customWidgets: [
                            Text('View All',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            )
                          ],
                          customWidths: [width * 0.24, width * 0.15],
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Theme.of(context).primaryColor],
                            [Colors.grey]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                            onViewAllClicked(categoryList[indexx!]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: 7,
              separatorBuilder: (context, indexx) {
                return SizedBox(
                  height: height * 0.02,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
