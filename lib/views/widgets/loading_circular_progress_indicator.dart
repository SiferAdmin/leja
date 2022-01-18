import 'package:flutter/material.dart';

class LoadingCircularProgressIndicator extends StatelessWidget {
  const LoadingCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: const [
        SizedBox(
          height: 200,
        ),
        SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
        Text('Loading... please wait!')
      ],
    ));
  }
}
