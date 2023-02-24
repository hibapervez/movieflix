import 'package:flutter/material.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/styles.dart';

class MediaLibScreen extends StatelessWidget {
  const MediaLibScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.mediaLib,
          style: AppStyles.regularTextStyle(
              fontSize: 20.0, color: AppColors.purple),
        ),
      ),
    );
  }
}
