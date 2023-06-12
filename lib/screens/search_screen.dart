import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            appProvider.displayText,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 80),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: CustomInput(),
          ),
          const SizedBox(height: 20),
          const CustomButton(),
        ],
      ),
    );
  }
}
