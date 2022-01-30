import 'package:flutter/material.dart';

import '../../models/address.dart';

import './text_container.dart';

class AddressContainer extends StatelessWidget {
  final Address address;

  const AddressContainer({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContainer(
          title: 'City',
          subtitle: address.city,
        ),
        TextContainer(
          title: 'Street',
          subtitle: address.street,
        ),
        TextContainer(
          title: 'Appartments',
          subtitle: address.suite,
        ),
        TextContainer(
          title: 'Zipcode',
          subtitle: address.zipcode,
        ),
      ],
    );
  }
}
