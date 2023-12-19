import 'package:bloc_fake_store_api/core/constants/colors.dart';
import 'package:bloc_fake_store_api/core/constants/text_styles.dart';
import 'package:bloc_fake_store_api/core/models/product.dart';
import 'package:bloc_fake_store_api/core/utils/screen_utilities.dart';
import 'package:bloc_fake_store_api/ui/screens/product_details/bloc/product_details_bloc.dart';
import 'package:bloc_fake_store_api/ui/widgets/custom_button.dart';
import 'package:bloc_fake_store_api/ui/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product_details_screen';

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(),
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: state is ProductDetailsIsExpandedState
                        ? state.isExpanded
                            ? 65.h
                            : 50.h
                        : 65.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        image: DecorationImage(
                      image: NetworkImage(
                        product.image ?? '',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.05), // Adjust opacity as needed
                        BlendMode.darken,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          kHeight(3.h),
                          Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back)),
                          ),
                          kHeight(2.h),
                          Text(
                            'Details',
                            style: normalTextStyle.copyWith(
                              fontSize: 30.px,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0.sp),
                            child: Text(
                              '${product.price} AED',
                              style: normalTextStyle2.copyWith(
                                fontSize: 30.px,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Bottom Container
                  GestureDetector(
                    onTap: () {
                      context.read<ProductDetailsBloc>().add(ProductDetailsToggleExpandedEvent());
                      // vm.showBottomSheet(context);
                    },
                    child: AnimatedContainer(
                      width: 100.w,
                      duration: const Duration(milliseconds: 300),
                      // height: vm.isExpanded ? 35.h : 50.h,
                      height: state is ProductDetailsIsExpandedState
                          ? state.isExpanded
                              ? 35.h
                              : 50.h
                          : 35.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.px),
                            topRight: Radius.circular(30.px),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Arrow
                            Center(
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: AppColors.colorPrimary,
                                size: 30.px,
                              ),
                            ),

                            ///Row of container and button
                            Row(
                              children: [
                                kWidth(2.w),
                                Container(
                                  height: 7.h,
                                  width: 14.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5), // Shadow color
                                        spreadRadius: 2, // Spread radius of the shadow
                                        blurRadius: 5, // Blur radius of the shadow
                                        offset: const Offset(0, 2), // Shadow offset
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.arrow_circle_up_outlined,
                                    color: AppColors.colorPrimary,
                                    size: 30.px,
                                  ),
                                ),
                                kWidth(7.w),
                                SizedBox(
                                  width: 72.w,
                                  child: CustomButton(
                                    onTap: () {},
                                    text: 'Order Now',
                                  ),
                                ),
                              ],
                            ),
                            kHeight(1.h),

                            ///text
                            const Text('Description'),
                            kHeight(1.h),

                            ///long textDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescri
                            Text(
                              '${product.description}',
                              // maxLines: vm.isExpanded ? 3 : 10,
                              maxLines: state is ProductDetailsIsExpandedState
                                  ? state.isExpanded
                                  ? 3
                                  : 10
                                  : 3,
                              overflow: TextOverflow.ellipsis,
                            ),

                            ///rating container
                            // !vm.isExpanded

                            state is ProductDetailsIsExpandedState
                                ? !state.isExpanded
                                ?  Container(
                              color: const Color(0xffF1F1F1),
                              width: 95.w,
                              height: 13.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  kHeight(1.h),
                                  Text(
                                    'Reviews ${product.rating?.count}',
                                    style: normalTextStyle2,
                                  ),
                                  kHeight(2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '${product.rating?.rate}',
                                        style: normalTextStyle2.copyWith(
                                          fontSize: 25.px,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      RatingBar(
                                        rating: product.rating!.rate!.toDouble(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                                : const SizedBox()
                                : const SizedBox(),

                          ],
                        ),
                      ),
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
