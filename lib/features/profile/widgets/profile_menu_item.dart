import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isDanger;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isDanger
        ? const Color(0xFFDC5C5C)
        : const Color(0xFF285C48);

    final titleColor = isDanger
        ? const Color(0xFFDC5C5C)
        : const Color(0xFF252A27);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            // Icon menu
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isDanger
                    ? const Color(0xFFFFEEEE)
                    : const Color(0xFFE7EFE8),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),

            const SizedBox(width: 14),

            // Text menu
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF68726C),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Arrow
            Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: isDanger
                  ? const Color(0xFFDC5C5C)
                  : const Color(0xFF9AA49D),
            ),
          ],
        ),
      ),
    );
  }
}
