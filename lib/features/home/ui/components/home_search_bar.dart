import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/styles/colors_app.dart';
import 'package:weather_app/core/styles/container_styles.dart';

class HomeSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final bool enable;
  final Function(String)? onChange;
  

  const HomeSearchBar({super.key, required this.enable, this.onChange});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(20.h);
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late TextEditingController _searchController;

  bool showClearButton = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide.none,
    );
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 10.h,
      ),
      decoration: ContainerStyles.elevationContainner,
      child: TextFormField(
        enabled: widget.enable,
        controller: _searchController,
        style: const TextStyle(
          height: 1.2,
        ),
        onChanged: (val) {
          if (val.isNotEmpty) {
            showClearButton = true;
            widget.onChange!(val);
          } else {
            showClearButton = false;
          }
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: "Search by city name ...",
          contentPadding: const EdgeInsets.symmetric(horizontal: 1),

          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Align(
            // alignment: Alignment.centerRight,
            widthFactor: 1.0,
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter:
                  const ColorFilter.mode(ColorsApp.kDarkGrey, BlendMode.srcIn),
              width: 25.w,
            ),
          ),
          suffixIconConstraints: BoxConstraints(maxWidth: 40.w),
          suffixIcon: !showClearButton
              ? null
              : Padding(
                  padding: EdgeInsetsDirectional.only(end: 12.w),
                  child: SizedBox(
                    width: 25.w,
                    height: 25.w,
                    child: MaterialButton(
                      onPressed: () {
                        _searchController.clear();
                        showClearButton = false;
                        setState(() {});
                      },
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.close,
                        size: 20.w,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
          // isDense: true,
          border: outlineInputBorder,
          errorBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
