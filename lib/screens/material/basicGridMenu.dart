import 'package:flutter/material.dart';
import '../../globalfunction.dart';

class GridMenuModel {
  String title;
  Icon menuIcon;
  String badgeText;
  Color badgeBackground;

  GridMenuModel(String title, Icon menuIcon, String badgeText, Color type) {
    this.title = title;
    this.menuIcon = menuIcon;
    this.badgeText = badgeText;
    this.badgeBackground = badgeBackground;
  }
}

List<GridMenuModel> gridMenus = [
  GridMenuModel("메뉴", Icon(Icons.add_location_alt_outlined, color: HexColor.fromHex("#A5000A")), "메뉴", Colors.red),
  GridMenuModel(
      "메뉴", Icon(Icons.add_photo_alternate_outlined, color: HexColor.fromHex("#A5000A")), "메뉴", Colors.blue),
  GridMenuModel("메뉴", Icon(Icons.add_shopping_cart, color: HexColor.fromHex("#A5000A"),), "메뉴", null),
  GridMenuModel("메뉴", Icon(Icons.add_to_drive, color: HexColor.fromHex("#A5000A")), "메뉴", null),
  GridMenuModel("메뉴", Icon(Icons.adjust, color: HexColor.fromHex("#A5000A")), "메뉴", Colors.blue),
  GridMenuModel("메뉴", Icon(Icons.admin_panel_settings_outlined, color: HexColor.fromHex("#A5000A")), "메뉴", null),
  GridMenuModel("메뉴", Icon(Icons.alarm, color: HexColor.fromHex("#A5000A")), "메뉴", null),
  GridMenuModel("메뉴", Icon(Icons.all_out, color: HexColor.fromHex("#A5000A")), "메뉴", Colors.blue),
  // GridMenuModel("테마 모텔", Icon(Icons.ac_unit), "", Colors.green),
  // GridMenuModel("미친특가", Icon(Icons.ac_unit), "프리미엄", Colors.red),
  // GridMenuModel("겨울호캉스", Icon(Icons.ac_unit), "대실할인", null), 
  // GridMenuModel("호텔빈방모음", Icon(Icons.ac_unit), "", null),
];

class BasicGridMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            itemCount: gridMenus.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                mainAxisSpacing: 16),
            itemBuilder: (c, index) {
              GridMenuModel gridMenuModel = gridMenus.elementAt(index);
              return GridBadgeMenuItem(gridMenuModel: gridMenuModel);
            }),
      ),
    );
  }
}

class GridBadgeMenuItem extends StatelessWidget {
  final GridMenuModel gridMenuModel;
  const GridBadgeMenuItem({
    Key key,
    @required this.gridMenuModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SpeechBubble(gridMenuModel: gridMenuModel),
            gridMenuModel.menuIcon,
            Container(height: 4),
            Text(gridMenuModel.title, style: TextStyle(color: HexColor.fromHex("#7f7f7f"), fontSize: 12),),
          ],
        ),
        );
  }
}

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    Key key,
    @required this.gridMenuModel,
  }) : super(key: key);
  final GridMenuModel gridMenuModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            gridMenuModel.title,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontFamily: '',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
