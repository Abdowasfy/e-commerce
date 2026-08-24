import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddressItemWidget extends StatelessWidget {
  final String address;
  final String addressDetails;
  const AddressItemWidget(
      {super.key, required this.address, required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: Colors.grey,
              size: 32.sp,
            ),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address, style: AppStyles.black15BoldStyle),
                const Gap(8),
                Text(addressDetails, style: AppStyles.grey12wMediumStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}