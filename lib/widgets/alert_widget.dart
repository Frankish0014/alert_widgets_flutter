import 'package:flutter/material.dart';

enum AlertType { info, success, warning, error }

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onDismiss,
  });

  final String title;
  final String message;
  final AlertType type;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (type) {
      AlertType.info => Colors.blue.shade50,
      AlertType.success => Colors.green.shade50,
      AlertType.warning => Colors.orange.shade50,
      AlertType.error => Colors.red.shade50,
    };

    final textColor = switch (type) {
      AlertType.info => Colors.blue.shade800,
      AlertType.success => Colors.green.shade800,
      AlertType.warning => Colors.orange.shade800,
      AlertType.error => Colors.red.shade800,
    };

    final icon = switch (type) {
      AlertType.info => Icons.info_outline,
      AlertType.success => Icons.check_circle_outline,
      AlertType.warning => Icons.warning_amber_outlined,
      AlertType.error => Icons.error_outline,
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(message, style: TextStyle(color: textColor)),
              ],
            ),
          ),
          if (onDismiss != null)
            IconButton(
              onPressed: onDismiss,
              icon: Icon(Icons.close, color: textColor),
            ),
        ],
      ),
    );
  }
}
