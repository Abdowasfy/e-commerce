import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 83.w,
              height: 79.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("T Shirt", style: AppStyles.black15BoldStyle),
                      Spacer(),
                      Icon(Icons.delete, color: Colors.red),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Text("1200 \$", style: AppStyles.black15BoldStyle),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.add, size: 16.sp),
                            ),
                          ),
                          const Gap(8),
                          Text("1", style: AppStyles.black15BoldStyle),
                          const Gap(8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.remove, size: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
