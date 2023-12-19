import 'package:bloc_fake_store_api/core/constants/colors.dart';
import 'package:bloc_fake_store_api/core/constants/text_styles.dart';
import 'package:bloc_fake_store_api/core/utils/screen_utilities.dart';
import 'package:bloc_fake_store_api/core/utils/utils.dart';
import 'package:bloc_fake_store_api/ui/screens/all_products/bloc/all_products_bloc.dart';
import 'package:bloc_fake_store_api/ui/screens/all_products/components/product_card.dart';
import 'package:bloc_fake_store_api/ui/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductsScreen extends StatelessWidget {
  static const String routeName = '/all_products_screen';

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProductsBloc()..add(AllProductsGetListEvent()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: Text(
              'All Products',
              style: normalTextStyle.copyWith(
                fontSize: 25.px,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 20,
          ),
        ),
        body: BlocConsumer<AllProductsBloc, AllProductsState>(
          listener: (context, state) {
            if (state is AllProductsErrorState) {
              Utils.showFlushBar(context, "Error", state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is AllProductsLoadingState)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.colorPrimary,
                      ),
                    ),
                  if (state is AllProductsLoadedState)
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.productsList.length,
                        separatorBuilder: (context, index) {
                          return kHeight(2.h);
                        },
                        itemBuilder: (context, index) {
                          var item = state.productsList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: item);
                            },
                            child: ProductCard(
                              image: item.image ?? '',
                              imageText: "${item.price} AED",
                              rating: item.rating?.rate?.toDouble() ?? 0.0,
                              productName: item.title ?? '',
                              productDesc: item.description ?? '',
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
