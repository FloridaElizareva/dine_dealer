import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  bool _showHint = true;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DDColors.bg,
      appBar: AppBar(
        backgroundColor: DDColors.bg,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: DDColors.ddBlack,
            fontFamily: FontFamily.robotoSerif,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE5D9),
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!_isFocused)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Search by restaurant name...',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      textAlign: TextAlign.start,
                      cursorColor: DDColors.ddBlack,
                      cursorWidth: 1.5,
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        color: DDColors.ddBlack,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'or find the perfect match with advanced\n search',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: DDColors.ddBlack,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.manrope,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.search,
                          size: 24,
                          color: DDColors.bg,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Find Restaurants',
                          style: TextStyle(
                            fontSize: 17,
                            color: DDColors.bg,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.manrope,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: DDColors.ddBlack,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
