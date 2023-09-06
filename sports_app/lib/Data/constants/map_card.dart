import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapCard extends StatelessWidget {
  final bool isSelected;
  final String text;
  const MapCard({super.key, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        // border: Border.all(color: iconColor),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr("Location details"),
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
