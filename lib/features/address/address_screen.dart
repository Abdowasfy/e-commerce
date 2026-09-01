import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/features/address/widgets/address_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address', style: TextStyle(fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const Gap(20),
            Text("Saved Address", style: AppStyles.black15BoldStyle),
            const Gap(24),
            Expanded(
              child: ListView(
                children: [
                  AddressItemWidget(
                    address: "Home.",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home.",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home.",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home.",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home.",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
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
