import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

class EffectiveStreamBuilder<T> extends StatefulWidget {
  final AsyncWidgetBuilder<T> builder;
  final Stream<T> stream;
  final T initialData;

  const EffectiveStreamBuilder({
    Key key,
    this.initialData,
    this.stream,
    @required this.builder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EffectiveStreamBuilderState<T>();
  }
}

class _EffectiveStreamBuilderState<T> extends State<EffectiveStreamBuilder> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key,
      onVisibilityChanged: (VisibilityInfo visibilityInfo) {
        _visible = visibilityInfo.visibleFraction > 0.0;
      },
      child: StreamBuilder<T>(
        key: widget.key,
        initialData: widget.initialData,
        stream: widget.stream.where((_) => _visible),
        builder: widget.builder,
      ),
    );
  }
}
