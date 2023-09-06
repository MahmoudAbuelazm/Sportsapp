import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TrillaButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  double? width;
  bool? withIcon;
  TrillaButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.withIcon = false,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 60.h,
          width: width,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5.r)),
          child: Center(
            child: withIcon!
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 25.r,
                        color: Colors.white,
                      )
                    ],
                  )
                : Text(
                    text,
                  ),
          ),
        ));
  }
}
