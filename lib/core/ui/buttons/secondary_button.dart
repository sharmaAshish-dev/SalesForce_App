part of buttons;

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const SecondaryButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Button(
      text: text,
      onPressed: onPressed,
      isPrimary: false,
    );
  }
}
