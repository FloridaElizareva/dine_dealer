import 'package:dine_dealer/core/l10n/generated/l10n.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/domain/controllers/log_in_controller.dart';
import 'package:dine_dealer/features/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({super.key});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  int? focusIndex;

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();

  final textEditingController1 = TextEditingController();
  final textEditingController2 = TextEditingController();
  final textEditingController3 = TextEditingController();
  final textEditingController4 = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LogInController>().startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.find<LogInController>().resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: DDColors.bg,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 28),
                    onPressed: Get.back,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter the code',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    L10n.current.enterCodeText1 +
                        controller.selectedCountry.code +
                        controller.phone,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCodeBox(
                        focusNode1,
                        textEditingController1,
                        nextFocusNode: focusNode2,
                      ),
                      _buildCodeBox(
                        focusNode2,
                        textEditingController2,
                        nextFocusNode: focusNode3,
                        prevFocusNode: focusNode1,
                      ),
                      _buildCodeBox(
                        focusNode3,
                        textEditingController3,
                        nextFocusNode: focusNode4,
                        prevFocusNode: focusNode2,
                      ),
                      _buildCodeBox(
                        focusNode4,
                        textEditingController4,
                        prevFocusNode: focusNode3,
                        onChange: () => sendOtp(controller),
                      ),
                    ],
                  ),
                  Text(
                    controller.enterCodeFailure != null ? controller.enterCodeFailure!.message : "",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    controller.resendTime > 0
                        ? L10n.current.enterCodeText3 + controller.resendTime.toString()
                        : L10n.current.enterCodeText4,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 120, 119, 119),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCodeBox(
    FocusNode focusNode,
    TextEditingController textEditingController, {
    FocusNode? nextFocusNode,
    FocusNode? prevFocusNode,
    void Function()? onChange,
  }) {
    return Container(
      width: 80,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xF0EEECE2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (value) {
          if (textEditingController.text.isEmpty && value.logicalKey.keyLabel == "Backspace") {
            prevFocusNode?.requestFocus();
          }
        },
        child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 24),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty && nextFocusNode != null) {
              nextFocusNode.requestFocus();
            } else if (value.isEmpty && prevFocusNode != null) {
              prevFocusNode.requestFocus();
            }

            if (onChange != null) {
              onChange();
            }
          },
        ),
      ),
    );
  }

  void sendOtp(LogInController controller) async {
    final code1 = textEditingController1.text;
    final code2 = textEditingController2.text;
    final code3 = textEditingController3.text;
    final code4 = textEditingController4.text;

    final code = code1 + code2 + code3 + code4;

    if (code.length == 4) {
      await controller.sendOtp(code);

      if (controller.enterCodeFailure == null) {
        Get.off(Onboarding());
      }
    }
  }
}
