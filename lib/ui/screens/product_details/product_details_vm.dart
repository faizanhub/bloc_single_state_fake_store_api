import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsVm extends ChangeNotifier {
  bool isExpanded = true;

  void toggleContainerSize() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
          width: 95.w,
          color: Colors.blue,
          child: Column(
            children: [
              // Additional data to show
              Text('sdfsdf'),
              Text('sdfsdf'),
              Text('sdfsdf'),
              Text('sdfsdf'),
            ],
          ),
        );
      },
    );
  }
}
