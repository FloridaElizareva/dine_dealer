import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/domain/controllers/booking_controller.dart';
import 'package:dine_dealer/features/pages/booking/widgets/booking_card.dart';
import 'package:dine_dealer/features/pages/booking/widgets/no_booking.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/no_favourites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<BookingController>().getBooking();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (controller) {
        if (controller.booking.isEmpty) {
          return SizedBox();
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF9F6EE),
          appBar: AppBar(
            backgroundColor: DDColors.bg,
            elevation: 0,
            centerTitle: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.robotoSerif,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text(
                      'New Booking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: FontFamily.manrope,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE5D9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: const Center(
                                child: Text(
                                  'Upcoming',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: FontFamily.manrope,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Text(
                                'Past',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontFamily: FontFamily.manrope,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: buildPage(controller),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPage(BookingController controller) {
    if (controller.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: DDColors.ddBlack,
          strokeWidth: 2.5,
        ),
      );
    }

    if (controller.booking.isEmpty) {
      return NoBooking();
    }

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemCount: controller.booking.length,
      itemBuilder: (context, index) {
        final booking = controller.booking[index];

        return BookingCard(
          image: 'assets/images/pasta.jpg',
          name: 'Oliver',
          restaurant: booking.selectedRestaurantName,
          people: booking.guestsCount,
          address: booking.address,
          date: booking.bookedDateTime,
        );
      },
    );
  }
}
