import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';

class AccountItemWidgets extends StatelessWidget {
  final String? title;

  final String? iconPath;

  final VoidCallback? onTap;

  const AccountItemWidgets({super.key, this.title, this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Image.asset(iconPath!, width: 24.w, height: 24.h),
            const Gap(16),
            Text(
              title!,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, size: 24.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
