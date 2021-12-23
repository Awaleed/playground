import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/helper.dart';
import '../../helpers/ui_utils.dart';
import '../config/app_config.dart';
import '../generated/l10n.dart';
import '../models/available_days.dart';
import '../models/teacher_model.dart';
import 'components/teacher_price.dart';

class TeacherDetailsScreen extends StatefulWidget {
  static const routeName = '/teacher_details';
  const TeacherDetailsScreen({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  final TeacherModel teacher;
  @override
  _TeacherDetailsScreenState createState() => _TeacherDetailsScreenState();
}

enum OrderPriceType {
  inPersonHourly,
  inPersonMonthly,
  onlineHourly,
  onlineMonthly
}

extension Stringify on OrderPriceType {
  String get hint {
    switch (this) {
      case OrderPriceType.onlineHourly:
      case OrderPriceType.inPersonHourly:
        return S.current.hours_count;
      case OrderPriceType.onlineMonthly:
      case OrderPriceType.inPersonMonthly:
        return S.current.months_count;
    }
  }

  String get suffix {
    switch (this) {
      case OrderPriceType.onlineHourly:
      case OrderPriceType.inPersonHourly:
        return S.current.hour;
      case OrderPriceType.onlineMonthly:
      case OrderPriceType.inPersonMonthly:
        return S.current.month;
    }
  }
}

class _TeacherDetailsScreenState extends State<TeacherDetailsScreen>
    with SingleTickerProviderStateMixin {
  OrderPriceType? orderType;
  AvailableDayModel? selectedTime;

  int? get selectedPrice {
    switch (orderType) {
      case OrderPriceType.inPersonHourly:
        return widget.teacher.hourPrice;
      case OrderPriceType.inPersonMonthly:
        return widget.teacher.monthPrice;
      case OrderPriceType.onlineHourly:
        return widget.teacher.onlineHourPrice;
      case OrderPriceType.onlineMonthly:
        return widget.teacher.onlineMonthPrice;
      case null:
        return null;
    }
  }

  int? get hoursPerMonth {
    switch (orderType) {
      case OrderPriceType.inPersonMonthly:
        return widget.teacher.monthNumberOfHours;
      case OrderPriceType.onlineMonthly:
        return widget.teacher.onlineMonthNumberOfHours;
      case OrderPriceType.inPersonHourly:
      case OrderPriceType.onlineHourly:
      case null:
        return null;
    }
  }

  int? get hoursCount {
    final value = hoursPerMonth ?? 1;

    return value;
  }

  final credentials = <String, dynamic>{};
  final formKey = GlobalKey<FormState>();

  int get total {
    return selectedPrice ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                ListTile(
                  leading: UiUtils.buildAvatarImage(widget.teacher.img),
                  title: Text(
                    Helpers.isArabic
                        ? widget.teacher.nameAr ?? ''
                        : widget.teacher.nameEn ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      S.current.teacher,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    buildIconTile(
                      label: S.current.city,
                      value: Txt('${widget.teacher.city}'),
                      iconName: 'location',
                    ),
                    buildIconTile(
                      label: S.current.years_of_experience,
                      value: Txt(widget.teacher.experiance ?? '-'),
                      iconName: 'certification',
                    ),
                    buildIconTile(
                      label: S.current.curriculum,
                      value: Txt(widget.teacher.education?.toString() ?? '-'),
                      iconName: 'book',
                    ),
                    //TODO: Fix view
                    // buildIconTile(
                    //   label: S.current.educational_level,
                    //   value: Txt('${widget.teacher.qualifyId}'),
                    // ),
                    // buildIconTile(
                    //   label: S.current.cases,
                    //   value: Expanded(
                    //     child: Txt(
                    //       (widget.coach.cases ?? []).join(', '),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${S.current.educational_level}: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final item in widget.teacher.qualifications ?? [])
                      Txt('$item'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  ('MyDescription'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  Helpers.isArabic
                      ? widget.teacher.detailsAr ?? ''
                      : widget.teacher.detailsEn ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                // const SizedBox(height: 10),
                // _buildPrice(S.current.hour_price, widget.teacher..hourPrice, priceType == PriceType.hourly),
                // const SizedBox(height: 10),
                // _buildPrice(S.current.month_price, widget.teacher.monthPrice, priceType == PriceType.monthly),
                // const SizedBox(height: 10),
                const SizedBox(height: 10),
                TeacherPriceWidget(
                  onSelected: (value) => setState(() => orderType = value),
                  prices: TeacherPriceModel(
                    inPersonHourPrice: widget.teacher.hourPrice,
                    inPersonMonthPrice: widget.teacher.monthPrice,
                    onlineHourPrice: widget.teacher.onlineHourPrice,
                    onlineMonthPrice: widget.teacher.onlineMonthPrice,
                    monthNumberOfHours: widget.teacher.monthNumberOfHours,
                    onlineMonthNumberOfHours:
                        widget.teacher.onlineMonthNumberOfHours,
                  ),
                ),

                const SizedBox(height: 10),
                if (selectedPrice == null || selectedPrice == 0) _buildPrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrice() {
    return Wrap(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/pays.svg',
                color: Colors.blueGrey, height: 14),
            const SizedBox(width: 10),
            Text(
              S.current.total,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text('${UiUtils.formatCurrency(total)} ${S.current.rial}',
                style: const TextStyle(color: Colors.red)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            Text(
              S.current.hours_count,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text('$hoursCount ${S.current.hour}',
                style: const TextStyle(color: Colors.red)),
          ],
        ),
      ],
    );
  }

  // String _makeText(int price, {bool useCurrency = true}) {
  //   if (price <= 0) {
  //     return S.current.unavailable;
  //   } else if (useCurrency) {
  //     return UiUtils.formatCurrency(price);
  //   } else {
  //     return price.toString();
  //   }
  // }

  // Widget _makeTableCell({
  //   required OrderPriceType value,
  //   required bool enabled,
  //   required String text,
  //   int hours = 0,
  // }) {
  //   final selected = value == orderType;
  //   return TableCell(
  //     child: Parent(
  //       style: ParentStyle()
  //         ..background.color(() {
  //           if (!enabled) {
  //             return UiUtils.getWhiteColorWithBrightness(context, lightThemeColor: Colors.grey.shade200);
  //           } else if (selected) {
  //             return kMainColor;
  //           } else {
  //             return kMainColor.shade100;
  //           }
  //         }())
  //         ..opacity(enabled && !selected ? .5 : 1)
  //         ..minHeight(40)
  //         ..ripple(enabled)
  //         ..elevation(0.1)
  //         ..padding(all: 5)
  //         ..alignmentContent.center(),
  //       gesture: Gestures()
  //         ..onTap(() {
  //           if (enabled) {
  //             setState(() => orderType = value);
  //           } else {
  //             DialogsHelpers.showErrorOverlay(context, S.current.unavailable);
  //           }
  //         }),
  //       child: Text(
  //         text + (hours == 0 ? '' : '\n${_makeText(hours, useCurrency: false)} ${S.current.hour}'),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }
}

class AvailableDaysWidget extends StatefulWidget {
  const AvailableDaysWidget(
      {Key? key, required this.days, required this.onDaySelected})
      : super(key: key);

  final List<AvailableDayModel> days;
  final ValueChanged<AvailableDayModel?> onDaySelected;

  @override
  State<AvailableDaysWidget> createState() => _AvailableDaysWidgetState();
}

class _AvailableDaysWidgetState extends State<AvailableDaysWidget> {
  AvailableDayModel? selectedDay;
  DayHourRangeModel? selectedDayHourRange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var item in getDays())
                Parent(
                  style: ParentStyle()
                    ..background.color(
                        widget.days.map((e) => e.day).contains(item)
                            ? kMainColor
                            : Colors.grey.shade300)
                    ..ripple(widget.days.map((e) => e.day).contains(item))
                    ..animate()
                    ..borderRadius(all: 10)
                    ..padding(all: 10)
                    ..margin(all: 10),
                  gesture: Gestures()
                    ..onTap(() {
                      setState(
                        () {
                          selectedDay = widget.days.firstWhere(
                            (element) => element.day == item,
                            orElse: () =>
                                AvailableDayModel(day: item, hours: []),
                          );
                          selectedDayHourRange = null;
                          widget.onDaySelected(null);
                        },
                      );
                    }),
                  child: FittedBox(
                    child: Text(
                      '$item',
                      style: TextStyle(
                          color: widget.days.map((e) => e.day).contains(item)
                              ? Colors.white
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (selectedDay != null)
          Parent(
            style: ParentStyle()
              ..background.color(UiUtils.getWhiteColorWithBrightness(context,
                  lightThemeColor: kMainColor))
              ..borderRadius(all: 10),
            child: Container(
              color: UiUtils.getWhiteColorWithBrightness(context),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (selectedDay!.hours.isEmpty)
                    Text(S.current.unavailable, textAlign: TextAlign.center)
                  else
                    for (final value in selectedDay?.hours ?? [])
                      Parent(
                        style: ParentStyle()
                          ..padding(all: 10)
                          ..animate()
                          ..background.color(selectedDayHourRange == value
                              ? kMainColor
                              : Colors.transparent),
                        gesture: Gestures()
                          ..onTap(() {
                            setState(() => selectedDayHourRange = value);
                            widget.onDaySelected(AvailableDayModel(
                                day: selectedDay!.day,
                                hours: [selectedDayHourRange!]));
                          }),
                        child: Text(
                            '${value.range.start.format(context)} - ${value.range.end.format(context)}',
                            textAlign: TextAlign.center),
                      ),
                ],
              ),
            ),
          )
      ],
    );
  }
}

Widget buildIconTile({
  required String label,
  required Widget value,
  String? iconName,
}) {
  return Parent(
    style: ParentStyle(),
    // ..background.color(Colors.white)
    // ..padding(all: 10)
    // ..margin(vertical: 5)
    // ..borderRadius(all: 10)
    // ..boxShadow(color: Colors.black.withOpacity(0.1), blur: 7, spread: 1),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Parent(
          style: ParentStyle(),
          // ..background.color(Colors.blue)
          // ..padding(all: 7)
          // ..borderRadius(all: 7),
          child: iconName == null
              ? const SizedBox(height: 15, width: 15)
              : SvgPicture.asset(
                  'assets/icons/$iconName.svg',
                  height: 15,
                  width: 15,
                  color: Colors.blue,
                ),
        ),
        const SizedBox(width: 10),
        if (label != S.current.city && label != S.current.years_of_experience)
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        // const SizedBox(width: 5),
        value,
        if (label == S.current.years_of_experience)
          Text(
            ' ${S.current.years}',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
      ],
    ),
  );
}
