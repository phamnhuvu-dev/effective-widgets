import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

class EffectiveWidget extends StatefulWidget {
  final Widget child;

  const EffectiveWidget({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EffectiveWidgetState();
  }
}

class _EffectiveWidgetState extends State<EffectiveWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key,
      onVisibilityChanged: (VisibilityInfo visibilityInfo) {
        _visible = visibilityInfo.visibleFraction > 0.0;
      },
      child: _visible ? widget.child : SizedBox.shrink(),
    );
  }
}
