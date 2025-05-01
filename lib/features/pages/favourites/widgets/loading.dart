import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/domain/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: _buildLoading(controller.isLoading),
          ),
        );
      },
    );
  }

  Widget? _buildLoading(bool isLoading) {
    if (isLoading) {
      return CircularProgressIndicator(
        color: DDColors.bg,
        strokeWidth: 2.5,
      );
    }
    
  
  }
}
