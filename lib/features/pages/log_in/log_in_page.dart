import 'package:dine_dealer/features/pages/log_in/widgets/phone_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DineDealer',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFE7632F),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/logoButton.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ' Your table\n your time\n our call.',
                style: TextStyle(
                  fontSize: 38,
                  height: 1.2,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Log In or Create an Account to Begin',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            PhoneNumberWidget(),
            SizedBox(height: 24),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.black87),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to the '),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: 'and\nacknowledge the '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
