import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool filled;
  final bool loading;

  const AppButton({super.key, required this.label, required this.onPressed, this.filled = true, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:
          filled
              ? FilledButton(
                onPressed: loading ? null : onPressed,
                child: loading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : Text(label),
              )
              : OutlinedButton(
                onPressed: loading ? null : onPressed,
                child: loading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : Text(label),
              ),
    );
  }
}
