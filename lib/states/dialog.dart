import 'package:flutter/material.dart';
import 'package:loginapp/states/constant.dart';
import 'package:loginapp/widgets/imagge.dart';
import 'package:loginapp/widgets/title.dart';

class Mydialog {
  Future<void> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyConstant.image1,
          ),
          title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
          subtitle:
              ShowTitle(title: message, textStyle: MyConstant().h3Style()),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ตกลง'))
        ],
      ),
    );
  }
}
