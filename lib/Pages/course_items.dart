import 'package:aerovania_app/Pages/bookmark_box.dart';
import 'package:aerovania_app/components/color.dart';
import 'package:aerovania_app/utils/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  CourseItem({super.key, required this.data, this.onBookmark});

  final data;
  final GestureTapCallback? onBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 290,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only( bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
              imageUrl: courses[0]["image"],
            ),
          ),
          Positioned(
            top: 175,
            right: 15,
            child: BookmarkBox(onTap: onBookmark, isBookmarked: data["is_favorited"],),
          ),
          Positioned(
            top: 215,
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses[0]["name"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getAttribute(Icons.sell_outlined, courses[0]["price"],
                          AppColor.labelColor),
                      getAttribute(Icons.play_circle_filled_outlined,
                          courses[0]["session"], AppColor.labelColor),
                      getAttribute(Icons.schedule_outlined,
                          courses[0]["duration"], AppColor.labelColor),
                      getAttribute(Icons.star, courses[0]["review"].toString(),
                          AppColor.yellow),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getAttribute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 13, color: AppColor.labelColor),
        ),
      ],
    );
  }
}
