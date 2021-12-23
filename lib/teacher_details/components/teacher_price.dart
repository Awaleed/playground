import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../config/app_config.dart';
import '../../../helpers/ui_utils.dart';
import '../teacher_details.dart';

class TeacherPriceModel {
  TeacherPriceModel({
    this.inPersonHourPrice = 0,
    this.inPersonMonthPrice = 0,
    this.onlineHourPrice = 0,
    this.onlineMonthPrice = 0,
    this.monthNumberOfHours = 0,
    this.onlineMonthNumberOfHours = 0,
  });

  int inPersonHourPrice;
  int inPersonMonthPrice;
  int onlineHourPrice;
  int onlineMonthPrice;

  int monthNumberOfHours;
  int onlineMonthNumberOfHours;

  bool validate() =>
      inPersonHourPrice != 0 ||
      (inPersonMonthPrice != 0 && monthNumberOfHours != 0) ||
      onlineHourPrice != 0 ||
      (onlineMonthPrice != 0 && onlineMonthNumberOfHours != 0);
}

class TeacherPriceWidget extends StatefulWidget {
  const TeacherPriceWidget({
    Key? key,
    required this.prices,
    required this.onSelected,
  }) : super(key: key);

  final TeacherPriceModel prices;
  final ValueChanged<OrderPriceType> onSelected;

  @override
  _TeacherPriceWidgetState createState() => _TeacherPriceWidgetState();
}

class _TeacherPriceWidgetState extends State<TeacherPriceWidget> {
  bool? isOnline = false;
  bool? isMonthly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.current.choose_teaching_method,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        Builder(
          builder: (context) {
            ParentStyle style({required bool selected}) => ParentStyle()
              ..background.color(selected ? kMainColor : Colors.grey.shade300)
              ..margin(all: 10)
              ..borderRadius(all: 10)
              ..animate()
              ..padding();
            Widget _buildChild(String label, {required bool selected}) => Txt(
                  label,
                  style: TxtStyle()
                    ..bold()
                    ..textColor(
                        selected ? Colors.white : const Color(0xff8D8F8E))
                    ..fontSize(12)
                    ..padding(all: 10)
                    ..animate()
                    ..alignmentContent.center(),
                );
            return Parent(
              style: ParentStyle()
                ..background.color(UiUtils.getWhiteColorWithBrightness(context,
                    lightThemeColor: const Color(0xffe9e9e9)))
                ..borderRadius(all: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Parent(
                      gesture: Gestures()
                        ..onTap(() {
                          setState(() => isOnline = false);
                          valueUpdated();
                        }),
                      style: style(selected: !(isOnline ?? true)),
                      child: _buildChild(S.current.in_person,
                          selected: !(isOnline ?? true)),
                    ),
                  ),
                  Expanded(
                    child: Parent(
                      gesture: Gestures()
                        ..onTap(() {
                          setState(() => isOnline = true);
                          valueUpdated();
                        }),
                      style: style(selected: isOnline ?? false),
                      child: _buildChild(S.current.online,
                          selected: isOnline ?? false),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (isOnline != null) ...[
          Text(S.current.choose_the_right_package_for_you,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Builder(
            builder: (context) {
              ParentStyle style({required bool selected}) => ParentStyle()
                ..background.color(selected ? kMainColor : Colors.grey.shade300)
                ..margin(all: 10)
                ..borderRadius(all: 10)
                ..animate()
                ..padding();
              Widget _buildChild(String label, {required bool selected}) => Txt(
                    label,
                    style: TxtStyle()
                      ..bold()
                      ..textAlign.center()
                      ..textColor(
                          selected ? Colors.white : const Color(0xff8D8F8E))
                      ..fontSize(12)
                      ..padding(all: 10)
                      ..animate()
                      ..alignmentContent.center(),
                  );

              final hour = isOnline!
                  ? widget.prices.onlineHourPrice
                  : widget.prices.inPersonHourPrice;
              final month = isOnline!
                  ? widget.prices.onlineMonthPrice
                  : widget.prices.inPersonMonthPrice;
              return Parent(
                style: ParentStyle()..borderRadius(all: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Parent(
                        gesture: Gestures()
                          ..onTap(() {
                            setState(() => isMonthly = false);
                            valueUpdated();
                          }),
                        style: style(selected: !(isMonthly ?? true)),
                        child: _buildChild(
                            '${S.current.hour_price}\n${_makeText(hour)}',
                            selected: !(isMonthly ?? true)),
                      ),
                    ),
                    Expanded(
                      child: Parent(
                        gesture: Gestures()
                          ..onTap(() {
                            setState(() => isMonthly = true);
                            valueUpdated();
                          }),
                        style: style(selected: isMonthly ?? false),
                        child: _buildChild(
                            '${S.current.month_price}\n${_makeText(month)}',
                            selected: isMonthly ?? false),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (isMonthly != null && isMonthly!)
            Text(
              '${S.current.hours_count_in_month}: ${isOnline! ? widget.prices.onlineMonthNumberOfHours : widget.prices.monthNumberOfHours}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ],
    );
  }

  String _makeText(int price, {bool useCurrency = true}) {
    if (price <= 0) {
      return S.current.unavailable;
    } else if (useCurrency) {
      return '${UiUtils.formatCurrency(price)} ${S.current.rial}';
    } else {
      return price.toString();
    }
  }

  void valueUpdated() {
    if (isMonthly == null || isOnline == null) return;
    if (isMonthly!) {
      widget.onSelected(isOnline!
          ? OrderPriceType.onlineMonthly
          : OrderPriceType.inPersonMonthly);
    } else {
      widget.onSelected(isOnline!
          ? OrderPriceType.onlineHourly
          : OrderPriceType.inPersonHourly);
    }
  }
}
