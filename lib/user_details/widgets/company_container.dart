import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './text_container.dart';

class CompanyContainer extends StatelessWidget {
  final String name;
  final String bs;
  final String phrase;

  const CompanyContainer({
    Key? key,
    required this.name,
    required this.bs,
    required this.phrase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContainer(
          title: 'Company Name',
          subtitle: name,
        ),
        TextContainer(
          title: 'Services',
          subtitle: bs,
        ),
        TextContainer(
          title: 'Phrase',
          subtitle: phrase,
        ),
      ],
    );
  }
}
