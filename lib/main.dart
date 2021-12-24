import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:split_view/split_view.dart';

import 'config/app_config.dart';
import 'core/new_api_caller.dart';
import 'cubits/base_data_cubit/base_data_cubit.dart';
import 'cubits/simple_data_cubit.dart';
import 'generated/l10n.dart';
import 'helpers/ui_utils.dart';
import 'models/teacher_model.dart';
import 'teacher_details/teacher_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum FilterType { all, uncategorized, deleted, selected }
enum SortBy { name, profileCompletion, registerDate }
enum SortDirection { ascending, descending }

extension on FilterType {
  String get name {
    switch (this) {
      case FilterType.all:
        return 'الكل';
      case FilterType.uncategorized:
        return 'غير مصنف';
      case FilterType.deleted:
        return 'تم الحذف';
      case FilterType.selected:
        return 'المحدد';
    }
  }

  Color get color {
    switch (this) {
      case FilterType.all:
        return Colors.transparent;
      case FilterType.uncategorized:
        return Colors.transparent;
      case FilterType.deleted:
        return Colors.red;
      case FilterType.selected:
        return Colors.green;
    }
  }
}

extension on SortBy {
  String get name {
    switch (this) {
      case SortBy.name:
        return 'الاسم';
      case SortBy.profileCompletion:
        return 'اكتمال البروفايل';
      case SortBy.registerDate:
        return 'تاريخ التسجيل';
    }
  }
}

extension on SortDirection {
  String get name {
    switch (this) {
      case SortDirection.ascending:
        return 'تصاعدي';
      case SortDirection.descending:
        return 'تنازلي';
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TeacherModel? selectedTeacher;
  bool showFilter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(showFilter ? Icons.hide_source : Icons.filter_alt_rounded),
          onPressed: () {
            setState(() => showFilter = !showFilter);
          },
        ),
        title: Text(S.current.teachers),
      ),
      body: SplitView(
        viewMode: SplitViewMode.Horizontal,
        indicator: const SplitIndicator(viewMode: SplitViewMode.Horizontal),
        activeIndicator: const SplitIndicator(
          viewMode: SplitViewMode.Horizontal,
          isActive: true,
        ),
        children: [
          if (selectedTeacher == null)
            const SizedBox()
          else
            TeacherDetailsScreen(teacher: selectedTeacher!),
          TeachersList(
            showFilter: showFilter,
            value: selectedTeacher,
            onChanged: (value) => setState(() => selectedTeacher = value),
          ),
        ],
      ),
    );
  }
}

final cubit = SimpleDataCubit<List<TeacherModel>>(
  logResponse: false,
  parser: (res) {
    return listParser(res, (data) => TeacherModel.fromJson(data));
  },
  path: '/test',
)..load();

class TeachersList extends StatefulWidget {
  const TeachersList({
    Key? key,
    required this.showFilter,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final bool showFilter;
  final TeacherModel? value;
  final ValueChanged<TeacherModel> onChanged;

  @override
  State<TeachersList> createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  String q = '';
  FilterType filterType = FilterType.all;
  SortBy sortBy = SortBy.name;
  SortDirection sortDirection = SortDirection.ascending;

  InputDecoration buildDecoration(String label) =>
      InputDecoration(border: const OutlineInputBorder(), labelText: label);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedSize(
          duration: 300.milliseconds,
          child: widget.showFilter
              ? Material(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            decoration: buildDecoration('ابحث هنا'),
                            onChanged: (value) {
                              setState(() => q = value);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            DropdownButtonFormField<FilterType>(
                              decoration: buildDecoration('فلترة'),
                              value: filterType,
                              items: FilterType.values
                                  .map(
                                    (e) => DropdownMenuItem<FilterType>(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  filterType = value ?? filterType;
                                });
                              },
                            ),
                            DropdownButtonFormField<SortBy>(
                              decoration: buildDecoration('ترتيب'),
                              value: sortBy,
                              items: SortBy.values
                                  .map(
                                    (e) => DropdownMenuItem<SortBy>(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  sortBy = value ?? sortBy;
                                });
                              },
                            ),
                            DropdownButtonFormField<SortDirection>(
                              decoration: buildDecoration('تصاعدي/تنازلي'),
                              value: sortDirection,
                              items: SortDirection.values
                                  .map(
                                    (e) => DropdownMenuItem<SortDirection>(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  sortDirection = value ?? sortDirection;
                                });
                              },
                            ),
                          ]
                              .map(
                                (e) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: e,
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: BlocBuilder<SimpleDataCubit<List<TeacherModel>>,
              BaseDataCubitState<List<TeacherModel>>>(
            bloc: cubit,
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                failure: (error) => Center(child: Text(error.message)),
                success: (value) {
                  final values = List<TeacherModel>.from(value);
                  values.retainWhere((element) => element.search(q));
                  if (filterType != FilterType.all) {
                    values.retainWhere(
                      (element) => element.filterType == filterType,
                    );
                  }
                  values.sort((a, b) {
                    TeacherModel first, second;
                    switch (sortDirection) {
                      case SortDirection.ascending:
                        first = a;
                        second = b;
                        break;
                      case SortDirection.descending:
                        first = b;
                        second = a;
                        break;
                    }

                    switch (sortBy) {
                      case SortBy.name:
                        return (first.nameAr ?? '')
                            .compareTo(second.nameAr ?? '');
                      case SortBy.profileCompletion:
                        return first.profileCompletionPercentage
                            .compareTo(second.profileCompletionPercentage);
                      case SortBy.registerDate:
                        return first.createdAt.compareTo(second.createdAt);
                    }
                  });

                  return ListView.builder(
                    itemCount: values.length,
                    itemBuilder: (context, index) => TeacherCard(
                      values[index],
                      isSelected: values[index] == widget.value,
                      onTap: () => widget.onChanged(values[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard(
    this.value, {
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final TeacherModel value;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListTile(
          onTap: onTap,
          tileColor: isSelected
              ? kMainColor.shade200
              : UiUtils.getWhiteColorWithBrightness(context),
          title: Text(value.nameAr ?? 'NULL'),
          trailing: FutureBuilder<FilterType?>(
            future: value.filterType,
            builder: (context, snapshot) {
              final f = snapshot.data ?? FilterType.uncategorized;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100,
                    width: 20,
                    color: f.color,
                  ),
                  PopupMenuButton<FilterType>(
                    initialValue: f,
                    itemBuilder: (context) => FilterType.values
                        .sublist(1)
                        .map(
                          (e) => PopupMenuItem<FilterType>(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onSelected: (value) async {
                      await this.value.setFilterType(value);
                      setState(() {});
                    },
                  ),
                ],
              );
            },
          ),
          leading: UiUtils.buildAvatarImage(value.img),
          subtitle: Row(
            children: [
              Text(
                  '${(value.profileCompletionPercentage * 100).toStringAsFixed(0)}%'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  value: value.profileCompletionPercentage,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
