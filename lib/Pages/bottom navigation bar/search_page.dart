import 'dart:developer';

import 'package:aerovania_app/Pages/category_items.dart';
import 'package:aerovania_app/Pages/course_details.dart';
import 'package:aerovania_app/Pages/course_items.dart';
import 'package:aerovania_app/components/color.dart';
import 'package:aerovania_app/utils/data.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  // const SearchScreen({super.key});
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.appBarColor,
              pinned: true,
              title: getAppBar(),
            ),
            SliverToBoxAdapter(
              child: getSearchBox(),
            ),
            SliverToBoxAdapter(
              // log("Inside SliverToBoxAdapterrrrrr"),
              child: getCategories(),
            ),
            SliverList(delegate: getCourses())
          ],
        ),
      ),
    );
  }

  getAppBar() {
    print('Inside App Barrrrrrr');
    return const Row(
      children: [
        Text(
          'Explore',
          style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
      ],
    );
  }

  getSearchBox() {
    print('Inside Search Barrrrrrr');
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .7,
              padding: const EdgeInsets.only(
                bottom: 3,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor.withOpacity(.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/icons/search.jpg"),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .08,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/icons/filter.jpg",
              // color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;
  getCategories() {
    print('Inside get Categoriesssss');
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 15),
        child: Row(
          children: List.generate(
            categories.length,
            (index) => CategoryItems(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              isActive: selectedCategoryIndex == index,
              data: categories[index],
            ),
          ),
        ),
      ),
    );
  }

  getCourses() {
    print('Inside get Coursesssss');
    return SliverChildBuilderDelegate(
      (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
          child: CourseItem(
            data: courses[index],
            onBookmark: () {
              courses[index]["is_favorited"] = !courses[index]["is_favorited"];
            },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => CourseDetails(
                      data: {"course": courses[index]},
                    ))));
            },
          ),
        );
      },
      childCount: courses.length,
    );
  }

  // getAttribute(IconData icon, String name, Color color) {
  //   print('Inside get atributessssss');
  //   return Row(
  //     children: [
  //       Icon(
  //         icon,
  //         size: 18,
  //         color: color,
  //       ),
  //       const SizedBox(
  //         width: 5,
  //       ),
  //       Text(
  //         name,
  //         style: const TextStyle(fontSize: 13, color: AppColor.labelColor),
  //       ),
  //     ],
  //   );
  // }
}
