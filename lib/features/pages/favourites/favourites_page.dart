import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/domain/controllers/favourites_controller.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/favourite_card.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/loading.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/no_favourites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Get.find<FavouritesController>().getFavourites();

        if (Get.find<FavouritesController>().favouritesFailure == null) {
          break;
        } else {
          await Future.delayed(Duration(seconds: 3));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9F6EE),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Favourites',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.robotoSerif,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: buildPage(controller),
          ),
        );
      },
    );
  }

  Widget buildPage(FavouritesController controller) {
    if (controller.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: DDColors.ddBlack,
          strokeWidth: 2.5,
        ),
      );
    }

    if (controller.favourites.isEmpty) {
      return NoFavourites();
    }

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemCount: controller.favourites.length,
      itemBuilder: (context, index) {
        final favourite = controller.favourites[index];

        return FavouriteCard(
          image: 'assets/images/pasta.jpg',
          title: favourite.name,
          address: favourite.address,
          reviews: favourite.reviews,
          rating: favourite.rating,
        );
      },
    );
  }
}
