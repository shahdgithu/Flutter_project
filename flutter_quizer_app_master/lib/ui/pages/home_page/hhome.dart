import 'package:flutter/material.dart';
import '../../../../models/category.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import '../../widgets/quiz_options.dart';


class HhomePage extends StatefulWidget {
  @override
  State<HhomePage> createState() => _HhomePageState();
}



class _HhomePageState extends State<HhomePage> {



  bool themeState = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 40.0),
                child: Text(
                  "Select a category to start the quiz",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 1000
                          ? 7
                          : MediaQuery.of(context).size.width > 600
                          ? 5
                          : 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                    _buildCategoryItem,
                    childCount: categories.length,
                  )),
            ),
          ],
        ),
      ),

    );

  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 4,
      highlightElevation: 1.0,
      color: Colors.green.withOpacity(0.3),

      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showDialog(
      context: context,
      builder: (sheetContext) => Dialog(
        child: QuizOptionsDialog(
          category: category,
        ),
      ),
    );
  }}
