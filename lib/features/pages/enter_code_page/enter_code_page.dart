import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 28),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Text(
                'Enter the code',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter the 4-digit code sent to you at +46 40 123 4567',
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
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Resend code in 20',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 120, 119, 119),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeBox(
    FocusNode focusNode,
    TextEditingController textEditingController, {
    FocusNode? nextFocusNode,
    FocusNode? prevFocusNode,
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
          print(value);
          if(textEditingController.text.isEmpty && value.logicalKey.keyLabel=="Backspace"){
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
          },
        ),
      ),
    );
  }
}
