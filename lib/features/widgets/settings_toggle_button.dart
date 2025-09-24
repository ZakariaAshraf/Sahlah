import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constants/app_colors.dart';

class SettingsToggleButton extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData trueIcon;
  final IconData falseIcon;
  final String? trueLabel;
  final String? falseLabel;

  const SettingsToggleButton({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.trueIcon,
    required this.falseIcon,
    this.trueLabel,
    this.falseLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: ListTile(
        trailing: ToggleSwitch(
          minWidth: 40.0,
          minHeight: 40.0,
          initialLabelIndex: value ? 0 : 1,
          cornerRadius: 10.0,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          icons: [trueIcon, falseIcon],
          // labels: [trueLabel, falseLabel],
          iconSize: 40.0,
          activeBgColors: [
            [AppColors.primary],
            const [Colors.black45, Colors.black26],
          ],
          onToggle: (index) {
            if (index == 0 && !value) {
              onChanged(true);
            } else if (index == 1 && value) {
              onChanged(false);
            }
          },
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}