import 'package:aerovania_app/components/color.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems(
      {super.key,
      required this.data,
      this.isActive = false,
      this.bgColor = Colors.white,
      this.onTap,
      this.activeColor = AppColor.primary});
  final data;
  final Color activeColor;
  final Color bgColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: isActive ? activeColor : bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.05),
                blurRadius: .5,
                spreadRadius: .5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Image(
                image: NetworkImage(data["icon"]),
                color: isActive ? Colors.white : AppColor.darker,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                data["name"],
                style:
                    TextStyle(color: isActive ? Colors.white : AppColor.darker),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
