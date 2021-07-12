import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 48.0,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
