part of buttons;

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const PrimaryButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Button(
      text: text,
      onPressed: onPressed,
      isPrimary: true,
    );
  }
}
