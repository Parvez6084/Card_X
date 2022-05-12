import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String? assetName;
  ImageDialog(this.assetName);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width *.9,
        height: 220,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(assetName!),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}