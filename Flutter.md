## flutter_app API学习

### Constraints  abstract class
An abstract set of layout constraints.

### ShapeBorder  abstract class
Base class for shape outlines.

### StatefulWidget 类
具有可变状态( state)的Widget(窗口小部件).
> build:Describes the part of the user interface represented by this widget.

### StatelessWidget 类 
不需要可变状态的小部件。

### Builder extends StatelessWidget 类
A platonic widget that calls a closure to obtain its child widget.

### MaterialApp extends StatefulWidget 类
An application that uses material design.

### Scaffold extends StatefulWidget 类
Implements the basic material design visual layout structure.
脚手架，最基本的布局
####属性值：
- appBar:(PreferredSizeWidget)标题 An app bar to display at the top of the scaffold.
- body: (Widget)The primary content of the scaffold
- floatingActionButton:(Widget) 在 Material 中定义的一个功能按钮。
- floatingActionButtonLocation:(FloatingActionButtonLocation) Responsible for determining where the [floatingActionButton] should go.
- floatingActionButtonAnimator:(FloatingActionButtonAnimator) Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation]
- persistentFooterButtons:A set of buttons that are displayed at the bottom of the scaffold.
- drawer:(Widget)侧边栏控件
- endDrawer:
- bottomNavigationBar:显示在底部的导航栏按钮栏。
- bottomSheet: The persistent bottom sheet to display.
- backgroundColor:背景颜色
- resizeToAvoidBottomPadding: = true, 控制界面内容 body 是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true。
- primary: = true,

### AppBar 显示在app的顶部
![AppBar 结构](./READMESRC/AppBar.png)
- leading:左上角的控件，一般放一个icon，位置如上图
- automaticallyImplyLeading = true,
- title:标题，位置如上图
- actions:	一系列的组件，位置如上图
- flexibleSpace:位置如上图
- bottom:位置如上图
- elevation = 4.0:阴影Z轴
- backgroundColor:背景颜色
- brightness:亮度
- iconTheme:图标样式
- textTheme:字体样式
- primary = true,
- centerTitle:(bool)title是否显示在中间
- titleSpacing = (double)NavigationToolbar.kMiddleSpacing The spacing around [title] content on the horizontal axis.
- toolbarOpacity = 1.0,
- bottomOpacity = 1.0,
```dart
 Widget build(BuildContext context) {
    new Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            title: Text('AppBar'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
              IconButton(icon: Icon(Icons.dashboard), onPressed: () {}),
              IconButton(icon: Icon(Icons.cached), onPressed: () {}),
            ],
            flexibleSpace: Container(
              color: Colors.red,
            ),
            bottom: PreferredSize(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.grey,
                child: Text('bottom'),
              ),
              preferredSize: Size(30, 100),
            ),
          ),
        );
}
```
   
### FloatingActionButton:标题
- child:子视图，一般为Icon，不推荐使用文字
- tooltip:FAB的文字解释，FAB被长按时显示，也是无障碍功能
- foregroundColor:前景色
- backgroundColor:背景色
- heroTag:hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果
- elevation:未点击时阴影值，默认6.0
- hignlightElevation:点击时阴影值，默认12.0
- onPressed:点击事件回调
- mini:是否为“mini”类型，默认为false
- shape:定义FAB的shape，设置shape时，默认的elevation将会失效,默认为CircleBorder
- isExtended:是否为”extended”类型
```dart
    Widget build(BuildContext context) {
        return new Scaffold(
          floatingActionButton: new Builder(builder: (BuildContext context) {
            return new FloatingActionButton(
              child: const Icon(Icons.add),
              tooltip: "Hello",
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              heroTag: null,
              elevation: 7.0,
              highlightElevation: 14.0,
              onPressed: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("FAB is Clicked"),
                ));
              },
              mini: false,
              shape: new CircleBorder(),
              isExtended: false,
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      }
```

### Icon extends StatelessWidget 图标
图形图标，来自于所述的字体的字形绘制。图标不可交互式。https://raw.githubusercontent.com/flutter/cupertino_icons/master/map.png
- icon:图形库，常量
- size:(double)逻辑像素中图标的大小(pt.dp)。由于图标是正方形，设置size等于同时设置了宽高。默认为当前IconTheme，大小24.0（带逻辑像素单位）
- color:设置图标颜色，如果没设置以主题是黑色则图标颜色默认为白色，如果主题较浅则图标颜色默认为黑色。
- semanticLabel:帮助盲人或者视力有障碍的用户提供语言辅助描述
- textDirection:渲染图标的方向,前提需要IconData.matchTextDirection字段设置为true
```
Icon(
      Icons.camera,
      size: 50,
      color: Colors.cyan,
      textDirection: TextDirection.ltr,
    );
```

###  ImageIcon extends StatelessWidget
自定义图形图标，来自于图片绘制。图标不可交互式。
- image：ImageProvider
- size
- color
- semanticLabel

### IconButton extends StatelessWidget
- iconSize = 24.0,
- padding = const EdgeInsets.all(8.0),
- alignment = Alignment.center,
- @required icon,
- color,
- highlightColor,
- splashColor,
- disabledColor,
- @required onPressed,
- tooltip

### AnimatedIcon extends StatelessWidget 
通过内部源码 可知：图像是通过画笔画成
- @required this.icon: (AnimatedIconData)
- @required this.progress:(Animation)
- color,
- size,
- semanticLabel,
- textDirection,

### PreferredSize extends StatelessWidget
A widget with a preferred size.This widget does not impose any constraints on its child, and it doesn't affect the child's layout in any way. It just advertises a preferred size which can be used by the parent.
- @required child
- @required preferredSize:(Size)

### SnackBar extends StatelessWidget
- @required content,
- backgroundColor,
- action,
- duration = _kSnackBarDisplayDuration,
- animation,
```
 Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("FAB is Clicked"),));
 Flutter SnakeBar弹不出来，报Scaffold.of() called with a context that does not contain a Scaffold.错误
 var _scaffoldkey = new GlobalKey<ScaffoldState>();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         key: _scaffoldkey,）
   }
 void showSnackBar(String message) {
    var snackBar = SnackBar(content: Text(message));
    _scaffoldkey.currentState.showSnackBar(snackBar);
 }
```

### CircleBorder extends ShapeBorder
A border that fits a circle within the available space
- side = BorderSide.none

### BorderSide class
Creates the side of a border.
- color = const Color(0xFF000000),
- width = 1.0,
- style = BorderStyle.solid,

### BorderStyle enum
if you add more, think about how they will lerp
- none:Skip the border.
- solid,  /// Draw the border as a solid line.

### Text extends StatelessWidget
两个构造方法 Text.rich(textSpan) Text(data) 二选一
```
new Text.rich(TextSpan(text:'Hello World' ),
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.black));
new Text('Hello World',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.black))
                    
```
- textSpan:(TextSpan)
- data:(String) 显示的文本
- style:(TextStyle)
- textAlign:(TextAlign)
- textDirection:(TextDirection)
- locale:(Locale)
- softWrap:(bool)是否自动换行，若为false，文字将不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
- overflow:(TextOverflow):How visual overflow should be handled.
- textScaleFactor:(double)字体显示倍率
- maxLines,
- semanticsLabel:(String)语义标签，相当于解释作用，没有实际意义

### abstract  Diagnosticable
 A base class for providing string and [DiagnosticsNode] debug representations describing the properties of an object.
 
### abstract  DiagnosticableTree extends Diagnosticable
 A base class for providing string and [DiagnosticsNode] debug representations describing the properties and children of an object.

### TextSpan extends DiagnosticableTree
- style:(TextStyle)
- text:(String)
- children:(List<TextSpan>)
- recognizer:(GestureRecognizer)

### TextStyle extends Diagnosticable 
- inherit = true:(bool) 是否继承
- color:
- fontSize:(double)
- fontWeight:(FontWeight)
- fontStyle:(FontStyle)
- letterSpacing:(double) The amount of space (in logical pixels) to add between each letter.
- wordSpacing:(double) The amount of space (in logical pixels) to add at each sequence of white-space (i.e. between each word).
- textBaseline:(TextBaseline) 文本绘制基线(alphabetic/ideographic)
- height,
- locale,
- foreground:(Paint)
- background:(Paint)
- shadows:(List<ui.Shadow>)
- decoration:(TextDecoration) 文字的下划线等
- decorationColor:(Color)
- decorationStyle:(TextDecorationStyle) 波浪线等
- debugLabel:(String)  A human-readable description of this text style. 相当于注释
- fontFamily:(String)
- package: The `package` argument must be non-null if the font family is defined in a package. It is combined with the `fontFamily` argument to set the [fontFamily] property.

### Paint class

### TextDecoration class
A linear decoration to draw near the text.
- none
- underline 
- overline 
- lineThrough

### TextDecorationStyle  enum
The style in which to draw a text decoration
- solid,
- double,
- dotted,
- dashed,
- wavy

### TextAlign  enum
- left,
- right,
- center,
- justify:
- start:与[TextDirection] 有关
- end:与[TextDirection] 有关

### TextDirection enum    
- rtl:The text flows from right to left (e.g. Arabic, Hebrew).
- ltr:The text flows from left to right (e.g., English, French).

### TextOverflow enum
裁剪方式
- clip:Clip the overflowing text to fix its container.
- fade:Fade the overflowing text to transparent.
- ellipsis:Use an ellipsis to indicate that the text has overflowed.

### Size extends OffsetBase
Holds a 2D floating-point size.
- width 
- height
### OffsetBase  abstract
Base class for [Size] and [Offset], which are both ways to describe a distance as a two-dimensional axis-aligned vector.

### Center extends Align
 A widget that centers its child within itself.
- widthFactor: widthFactor
- heightFactor: heightFactor
- child: child

### Align extends SingleChildRenderObjectWidget
A widget that aligns its child within itself and optionally sizes itself based on the child's size.
相当于盒子模型
- alignment = Alignment.center,
- widthFactor,
- heightFactor,
- child:(Widget)

### Alignment extends AlignmentGeometry
- topLeft:Alignment(-1.0, -1.0);
- topRight:Alignment(1.0, -1.0);
- centerLeft:Alignment(-1.0, 0.0);
- center:Alignment(0.0, 0.0);
- centerRight:Alignment(1.0, 0.0);
- bottomLeft:Alignment(-1.0, 1.0);
- bottomCenter:Alignment(0.0, 1.0);
- bottomRight:Alignment(1.0, 1.0);

### FractionalOffset extends Alignment
即在 Alignment 基础上所有坐标点上加 1.0

### BoxDecoration extends Decoration
 An immutable description of how to paint a box.
- color:The color to fill in the background of the box.
- image:(DecorationImage)
- border:(BoxBorder)
- borderRadius:(BorderRadius)
- boxShadow:(List<BoxShadow>) 阴影
- gradient:(Gradient)  A gradient to use when filling the box.
- backgroundBlendMode,
- shape = BoxShape.rectangle,
 ```
 Container(
    decoration: BoxDecoration(
    color: const Color(0xff7c94b6),
    image: DecorationImage(
      image: ExactAssetImage('images/flowers.jpeg'),
     fit: BoxFit.cover,
     ),
    border: Border.all(
       color: Colors.black,
       width: 8.0,
     ),
  ),
 )
```

### Decoration extends Diagnosticable abstract

### Border extends BoxBorder
- top = BorderSide.none,
- right = BorderSide.none,
- bottom = BorderSide.none,
- left = BorderSide.none,
- Border.all()

### BoxBorder extends ShapeBorder abstract
 A border to draw above the background [color], [gradient], or [image].
 
### BorderRadius extends BorderRadiusGeometry
 An immutable set of radii for each corner of a rectangle. 提供圆角的方法
- BorderRadius.all()
- BorderRadius.only()

### BoxShadow extends ui.Shadow
- color = const Color(0xFF000000),
- offset = Offset.zero:偏移量
- blurRadius = 0.0:圆角
- spreadRadius = 0.0:应用模糊之前，框应该充气的量。

### LinearGradient extends Gradient
- begin = Alignment.centerLeft,
- end = Alignment.centerRight,
- @required List<Color> colors,
- stops:(List<double>)It specifies fractions of the radius between 0.0 and 1.0, giving concentric rings for each color stop.
- tileMode = TileMode.clamp, 与[begin],[end]结合使用

###  TileMode enum
- clamp :Edge is clamped to the final color.
- repeated:Edge is repeated from first color to last.
- mirror:Edge is mirrored from last color to first.

### Image extends StatefulWidget
- @required image:(ImageProvider)The image to display. 获取方式很多:https://blog.csdn.net/poorkick/article/details/80458707
- semanticLabel,
- excludeFromSemantics = false: If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
- width,
- height,
- color,
- colorBlendMode = BlendMode.srcIn:图层处理
- fit:(BoxFit) 填充方式
- alignment = Alignment.center,
- repeat = ImageRepeat.noRepeat,
- centerSlice:(Rect) 当图片需要被拉伸显示的时候，centerSlice定义的矩形区域会被拉伸，可以理解成我们在图片内部定义来一个点9文件用作拉伸。也就是说只有在显示大小大于原图大小的情况下，才允许使用这个属性，否则会报错。
- matchTextDirection = false,与Directionality配合使用
- gaplessPlayback = false,当ImageProvider发生变化后，重新加载图片的过程中，原图片的展示是否保留。若值为true，保留，若为false，不保留，直接空白等待下一张图片加载。
- filterQuality = FilterQuality.low,图片质量

### FadeInImage
在 Image 基础上 加入淡入淡出动画

### BlendMode enum
颜色与图片不同的组合方式 28 种
- clear,Drop both the source and destination images, leaving nothing.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_clear.png)
- src,Drop the destination image, only paint the source image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_src.png)
- dst, Drop the source image, only paint the destination image. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dst.png)
- srcOver, Composite the source image over the destination image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_srcOver.png)
- dstOver,Composite the source image under the destination image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dstOver.png)
- srcIn,Show the source image, but only where the two images overlap. The destination image is not rendered, it is treated merely as a mask. The color channels of the destination are ignored, only the opacity has an effect. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_srcIn.png)
- dstIn, Show the destination image, but only where the two images overlap. The source image is not rendered, it is treated merely as a mask. The color channels of the source are ignored, only the opacity has an effect.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dstIn.png)
- srcOut,  Show the source image, but only where the two images do not overlap. The destination image is not rendered, it is treated merely as a mask. The color channels of the destination are ignored, only the opacity has an effect.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_srcOut.png)
- dstOut, Show the destination image, but only where the two images do not overlap. The source image is not rendered, it is treated merely as a mask. The color channels of the source are ignored, only the opacity has an effect.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dstOut.png)
- srcATop, Composite the source image over the destination image, but only where it overlaps the destination. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_srcATop.png)
- dstATop, Composite the destination image over the source image, but only where it overlaps the source. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dstATop.png)
- xor, Apply a bitwise `xor` operator to the source and destination images. This leaves transparency where they would overlap. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_xor.png)
- plus, Sum the components of the source and destination images.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_plus.png)
- modulate, Multiply the color components of the source and destination images. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_modulate.png)
- screen,  Multiply the inverse of the components of the source and destination images, and inverse the result.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_screen.png)
- overlay, Multiply the components of the source and destination images after adjusting them to favor the destination.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_overlay.png)
- darken, Composite the source and destination image by choosing the lowest value from each color channel. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_darken.png)
- lighten, Composite the source and destination image by choosing the highest value from each color channel. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_lighten.png)
- colorDodge, Divide the destination by the inverse of the source. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_colorDodge.png)
- colorBurn, Divide the inverse of the destination by the the source, and inverse the result. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_colorBurn.png)
- hardLight, Multiply the components of the source and destination images after adjusting them to favor the source. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_hardLight.png)
- softLight, Use [colorDodge] for source values below 0.5 and [colorBurn] for source values above 0.5. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_softLight.png)
- difference, Subtract the smaller value from the bigger value for each channel. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_difference.png)
- exclusion,Subtract double the product of the two images from the sum of the two images. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_exclusion.png)
- multiply,  Multiply the components of the source and destination images, including the alpha channel. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_multiply.png)
- hue,Take the hue of the source image, and the saturation and luminosity of the destination image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_hue.png)
- saturation, Take the saturation of the source image, and the hue and luminosity of the destination image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_hue.png)
- color, Take the hue and saturation of the source image, and the luminosity of thedestination image.![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_color.png)
- luminosity, Take the luminosity of the source image, and the hue and saturation of thedestination image. ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_luminosity.png)

### BoxFit enum
- fill,
- contain,
- cover,
- fitWidth,
- fitHeight,
- none,
- scaleDown:Align the source within the target box (by default, centering) and, if necessary, scale the source down to ensure that the source fits within the box.


## flutter 布局学习

### Wrap
- direction = Axis.horizontal,
- alignment = WrapAlignment.start,
- spacing = 0.0： 主轴间隔，如果为 Axis.horizontal，则是横向间隔
- runAlignment = WrapAlignment.start,
- runSpacing = 0.0： 辅轴间隔，如果为 Axis.horizontal，则是纵向间隔
- crossAxisAlignment = WrapCrossAlignment.start,
- textDirection,
- verticalDirection = VerticalDirection.down,

### Flexible extends ParentDataWidget<Flex>
作用与 Expanded 一样 
但 Flexible 有fit 属性 默认为 fit = FlexFit.loose
而 Expanded 无fit 属性 默认为 fit = FlexFit.tight

### Expanded extends Flexible
A widget that controls how a child of a [Row], [Column], or [Flex] flexes.并且 Expanded组件必须用在Row、Column、Flex内。
Row、Column、Flex会被Expanded撑开，充满主轴可用空间。

### Row extends Flex  Column extends Flex
https://www.jianshu.com/p/0ce74751d970
`Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Flex > Row`
A widget that displays its children in a horizontal array.
- MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start:主轴的对齐方式
- MainAxisSize mainAxisSize = MainAxisSize.max:在主轴方向占有空间的值，默认是max。
- CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center:children在交叉轴方向的对齐方式，
- TextDirection textDirection:阿拉伯语系的兼容设置，一般无需处理。
- VerticalDirection verticalDirection = VerticalDirection.down:定义了children摆放顺序，默认是down。
- TextBaseline textBaseline,
- List<Widget> children = const <Widget>[]:子视图

### Flex
Flex的构造函数就比Row和Column的多了一个参数。Row跟Column的区别，正是这个direction参数的不同。当为Axis.horizontal的时候，则是Row，当为Axis.vertical的时候，则是Column。

### MainAxisAlignment enum
How the children should be placed along the main axis in a flex layout.
- center：将children放置在主轴的中心；
- end：将children放置在主轴的末尾；
- spaceAround：将主轴方向上的空白区域均分，使得children之间的空白区域相等，但是首尾child的空白区域为1/2；
- spaceBetween：将主轴方向上的空白区域均分，使得children之间的空白区域相等，首尾child都靠近首尾，没有间隙；
- spaceEvenly：将主轴方向上的空白区域均分，使得children之间的空白区域相等，包括首尾child；
- start：将children放置在主轴的起点；

### MainAxisSize enum
How much space should be occupied in the main axis.
- max：根据传入的布局约束条件，最大化主轴方向的可用空间；
- min：与max相反，是最小化主轴方向的可用空间；

### CrossAxisAlignment
How the children should be placed along the cross axis in a flex layout.
- baseline：在交叉轴方向，使得children的baseline对齐；
- center：children在交叉轴上居中展示；
- end：children在交叉轴上末尾展示；
- start：children在交叉轴上起点处展示；
- stretch：让children填满交叉轴方向；

### CrossAxisAlignment enum
How the children should be placed along the cross axis in a flex layout.
- down：从top到bottom进行布局；
- up：从bottom到top进行布局。

### TextBaseline enum
A horizontal line used for aligning text. 感觉没啥用
- alphabetic,
- ideographic,

### Container extends StatelessWidget
A convenience widget that combines common painting, positioning, and sizing widgets.
- alignment:(AlignmentGeometry) Alignment表达对齐方式
- padding:(EdgeInsetsGeometry)
- color,
- decoration:(Decoration)绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。
- foregroundDecoration:绘制在child前面的装饰。
- width,
- height,
- constraints:(BoxConstraints)添加到child上额外的约束条件。
- margin,
- transform(Matrix4),设置container的变换矩阵
- child,
```dart
Widget build(BuildContext context) {
  return new Container(
      constraints: new BoxConstraints.expand(
        height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      decoration: new BoxDecoration(
        border: new Border.all(width: 2.0, color: Colors.red),
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        image: new DecorationImage(
          image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: new Text('Hello World',
        style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
      transform: new Matrix4.rotationZ(0.3),
  );
}
```
### BoxConstraints extends Constraints  
- minWidth = 0.0,
- maxWidth = double.infinity,
- minHeight = 0.0,
- maxHeight = double.infinity
一般使用他的方法
- expand({ double width, double height})可理解为拉伸 Creates box constraints that expand to fill another box constraints.

### Stack
`Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Stack`
A widget that positions its children relative to the edges of its box.
Stack的布局行为，根据child是positioned还是non-positioned来区分。
1. 对于positioned的子节点，它们的位置会根据所设置的top、bottom、right以及left属性来确定，这几个值都是相对于Stack的左上角；
2. 对于non-positioned的子节点，它们会根据Stack的aligment来设置位置。

- alignment = AlignmentDirectional.topStart,
- textDirection,
- fit = StackFit.loose, 定义如何设置non-positioned节点尺寸，默认为loose。
>loose：子节点宽松的取值，可以从min到max的尺寸；
expand：子节点尽可能的占用空间，取max尺寸；
passthrough：不改变子节点的约束条件。
- overflow = Overflow.clip,超过的部分是否裁剪掉（clipped || visible）
-  children:(List),
```
Stack(
  alignment: const Alignment(0.6, 0.6),
  children: [
    CircleAvatar(
      backgroundImage: AssetImage('images/pic.jpg'),
      radius: 100.0,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Text(
        'Mia B',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ],
);
```

### IndexedStack extends Stack
A Stack that shows a single child from a list of children.
IndexedStack继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致。

- final int index:The index of the child to show.
```
Container(
  color: Colors.yellow,
  child: IndexedStack(
    index: 1,
    alignment: const Alignment(0.6, 0.6),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('images/pic.jpg'),
        radius: 100.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),
        child: Text(
          'Mia B',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
)
```

### ListView extends BoxScrollView > ScrollView  > StatelessWidget
一般使用 ListView.builder ListView.custom

- Axis scrollDirection = Axis.vertical,
- bool reverse = false:Item 的顺序是否反转，若为 true 则反转。
- ScrollController controller：滑动监听
- bool primary:是否是与 PrimaryScrollController 关联的主滚动视图，若为 true 则 controller 必须为空。  
- ScrollPhysics physics：设置 ListView 如何响应用户的滑动行为，值为一个 ScrollPhysics 对象，它的实现类常用的有：
```
    AlwaysScrollableScrollPhysics：总是可以滑动。
    NeverScrollableScrollPhysics：禁止滚动。
    BouncingScrollPhysics：内容超过一屏，上拉有回弹效果。
    ClampingScrollPhysics：包裹内容，不会有回弹，感觉跟 AlwaysScrollableScrollPhysics 差不多。
```
- bool shrinkWrap = false,
- EdgeInsetsGeometry padding：整个 ListView 的内间距。
- double itemExtent： Item 的范围，scrollDirection 为 Axis.vertical 时限制高度，scrollDirection 为 Axis.horizontal 限制宽度。
- @required IndexedWidgetBuilder itemBuilder,
- int itemCount,
- bool addAutomaticKeepAlives = true,
- bool addRepaintBoundaries = true,
- bool addSemanticIndexes = true,
- double cacheExtent：预加载的区域。
- int semanticChildCount,
- SliverChildDelegate childrenDelegate; 使用ListView.custom构造方法时，需自定义


### Divider extends StatelessWidget
 A one device pixel thick horizontal line, with padding on either side.

### TextField extends StatefulWidget
需注意 TextField 外部需有 Expanded 等包裹住 不然报错
- controller:(TextEditingController)            //控制器，控制TextField文字
```
var controller1 = TextEditingController.fromValue(TextEditingValue(
        text: title,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: title.length))));
```
- focusNode,
- decoration: const InputDecoration(),      //输入器装饰
`decoration:InputDecoration.collapsed(hintText: "Send your message"),`
- TextInputType keyboardType: TextInputType.text, //输入的类型
- textCapitalization ：TextCapitalization.none,
- this.style,
- textAlign: TextAlign.start,
- autofocus: false,
- obscureText: false,  //是否隐藏输入
- autocorrect: true,
- maxLines: 1,
- maxLength,
- maxLengthEnforced: true,
- onChanged：文字改变触发
- onSubmitted：文字提交触发（键盘按键）
- onEditingComplete,  //当用户提交可编辑内容时调用
- inputFormatters,//[WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
- enabled,//是否禁用
- cursorWidth = 2.0,
- cursorRadius,
- cursorColor,
- keyboardAppearance,

### InputDecoration 
const InputDecoration({
    this.icon,
    this.labelText,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.hasFloatingPlaceholder = true,
    this.isDense,
    this.contentPadding,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.prefixStyle,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.counterText,
    this.counterStyle,
    this.filled,
    this.fillColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.enabled = true,
    this.semanticCounterText,
  })



### GestureDetector
Flutter中的手势系统分为两层，第一层是触摸原事件（指针），有相应的四种事件类型。

1. PointerDownEvent ：用户与屏幕接触产生了联系。 
2. PointerMoveEvent ：手指已从屏幕上的一个位置移动到另一个位置。 
3. PointerUpEvent ：用户已停止接触屏幕。 
4. PointerCancelEvent ：此指针的输入不再指向此应用程序。

第二层就是我们可以检测到的手势，主要分为三大类，包括轻击，拖动和缩放，下面是具体的手势监听方法。

点击（一次）：

onTapDown ：点击屏幕立即触发此方法。
onTapUp ：手指离开屏幕。
onTap ：点击屏幕。
onTapCancel：此次点击事件结束，onTapDown不会在产生点击事件。
双击：

onDoubleTap ：用户快速连续两次在同一位置点击屏幕。
长按：

onLongPress ：长时间保持与相同位置的屏幕接触
垂直拖动：

onVerticalDragStart： 与接触屏幕，可能会开始垂直移动。
onVerticalDragUpdate：与屏幕接触并垂直移动的指针在垂直方向上移动
onVerticalDragEnd ：之前与屏幕接触并垂直移动的指针不再与屏幕接触，并且在停止接触屏幕时以特定速度移动
水平拖动：

onHorizontalDragStart ：与接触屏幕，可能开始水平移动
onVerticalDragUpdate：与屏幕接触并水平移动的指针在水平方向上移动
onVerticalDragEnd ：先前与屏幕接触并且水平移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动

### InkWell extends InkResponse
InkResponse 对 GestureDetector 再封装，使它具有 Material 的效果

### MaterialButton
- @required onPressed,
- onHighlightChanged,
- textTheme,
- textColor,
- disabledTextColor,
- color,
- disabledColor,
- highlightColor,
- splashColor:点击按钮时水波纹的颜色
- colorBrightness : The theme brightness to use for this button. 没有特别大的作用
- elevation,
- highlightElevation： 点击时阴影
- disabledElevation：禁用时阴影
- padding,
- shape（ShapeBorder）
```
BeveledRectangleBorder 带斜角的长方形边框
CircleBorder 圆形边框
RoundedRectangleBorder 圆角矩形
StadiumBorder 两端是半圆的边框
```
- clipBehavior = Clip.none,
- materialTapTargetSize：可点击范围
- animationDuration ：Defines the duration of animated changes for [shape] and [elevation].
- minWidth,
- height,
- child,
#### RaisedButton 
凸起的按钮，其实就是Android中的Material Design风格的Button ，继承自MaterialButton
注意：Raised buttons have a minimum size of 88.0 by 36.0 which can be overidden with [ButtonTheme].
```
ButtonTheme(
              height: 48.0,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                splashColor:Colors.blue,
                highlightElevation:10.00,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
```
#### FlatButton 
扁平化的按钮，继承自MaterialButton
#### OutlineButton
带边框的按钮，继承自MaterialButton 
#### IconButton	
图标按钮,继承自StatelessWidget
### ButtonBar
An end-aligned row of buttons.
```
    ButtonBar(
        children: <Widget>[
            RaisedButton(onPressed: (){},child: Text('login'),color: Colors.white,)
        ],
        )
```

## Flutter 动画相关
### Animation
动画系统的主要构建块是Animation类。动画表示可以在动画生命周期内改变的特定类型的值。
执行动画的大多数控件都会接收一个Animation对象作为参数，从中读取动画的当前值，并监听对象对该值的更改。
An animation with a value of type `T`.
- animation.value 动画当前的值，动画就是用 value 来描述一系列的动作
- animation.status
- animation.addListener
每当动画的值更改时，动画通知所有添加了addListener的监听器。通常，监听动画的State对象将在其监听器回调中调用setState，以通过动画的新值向控件系统通知其需要重构。
- animation.addStatusListener
监听AnimationStatus 的 4种状态 dismissed,  forward,  reverse,  completed,
  



### AnimationController extends Animation<double> with AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin
https://www.jianshu.com/p/0a40e04ab9fa 源码分析 讲的不错
要创建动画，首先创建一个AnimationController。除了作为动画本身，AnimationController可以让您控制动画。例如，您可以告诉控制器forward（向前播放）或stop（停止）动画。您还可以fling（投掷）动画，其使用诸如弹簧的物理模拟来驱动动画。
创建动画控制器后，就可以基于它开始构建其他动画。例如，可以创建一个ReverseAnimation，反映原始动画，但反向运行（比如从1.0到0.0）。类似地，还可以创建一个CurvedAnimation，曲线动画，其值由curve调整。
```
AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat()
```
或者
```
_animationController = AnimationController(
        duration: Duration(microseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: -100.00)
        .animate(
        CurvedAnimation(parent: _animationController,
            curve: Curves.fastOutSlowIn));
```


### AnimatedBuilder extends 
`AnimatedWidget > StatefulWidget`
A general-purpose widget for building animations.注意在 widget 生命周期结束时销毁
- Listenable animation：动画控制器，控制动画如何执行

- @required (TransitionBuilder)builder：builder(context, child):
Called every time the animation changes value.每一帧动画重新调用
- child:供 builder 方法调用，描述 builder 内部组件

### Tween
A linear interpolation between a beginning and ending value.
动画在0.0到1.0的区间，可以使用Tween，它在其begin（开始）和end（结束）值之间进行插值。许多类型具有特定的Tween子类，提供类型特定的插值。
例如， ColorTween在颜色之间进行插值，并在矩形之间插入RectTween。您可以通过创建自己的Tween子类并覆盖其lerp函数来定义自己的插值。
补间只是定义了如何在两个值之间插值。要获取动画当前帧的具体值，您还需要一个动画来确定当前状态。将补间动画与动画结合起来有两种方法，获得一个具体的值：
使用evaluate获取动画当前值的补间。这个方法对于已经在监听动画的控件最为有用，因此每当动画改变值时重建。
使用animate为补间动画添加动画。而不是返回单个值，animate函数返回一个包含补间的新动画。当您想要将新创建的动画提供给另一个控件时，此方法最为有用，然后可以读取包含补间的当前值以及监听对值的更改。
 ```
 _animation = _controller.drive(
   Tween<Offset>(
     begin: const Offset(100.0, 50.0),
     end: const Offset(200.0, 300.0),
   ),
 );
```
```
 _animation = Tween<Offset>(
   begin: const Offset(100.0, 50.0),
   end: const Offset(200.0, 300.0),
 ).animate(_controller);
```

实现类：EdgeInsetsTween extends Tween 
BorderRadiusTween 等

### Flutter 封装的几种动画
- FadeTransition  透明度变化
- ScaleTransition 等比例 缩放
- RotationTransition 角度旋转
- SlideTransition 幻动片播放
- AnimatedCrossFade 交叉 透明度变化


### StreamController
1. 基本用途：A controller with the stream it controls. 流的控制器，创建流的方式之一；
2. 内部属性含义
- sink Returns a view of this object that only exposes the [StreamSink] interface.可以看做是StreamController的入口
- sink.add StreamSink 的 add 方法 可以放入任何方法等
- stream  The stream that this controller is controlling StreamController 控制的东西，stream 是先进先出的
 
### Stream
A source of asynchronous data events. 同步的数据
A Stream provides a way to receive a sequence of events.
1. 构造方法

Stream.fromFuture(Future<T> future)
Stream.fromFutures(Iterable<Future<T>> futures)
Stream.fromIterable(Iterable<T> elements)

2. 方法
where where(bool test(T event)) ,传入bool类型的返回值函数，过滤输出数据
take(int count) ,表示接受输入的次数，当传输次数达到这个数字时，这个流将会关闭，无法再传输。
transform



### StreamSubscription
A subscription on events from a [Stream].
```
 StreamController controller = StreamController();

 //监听这个流的出口，当有data流出时，打印这个data
  StreamSubscription subscription =
  controller.stream.listen((data)=>print(data));

  controller.sink.add(321);
```

### StreamBuilder
Widget that builds itself based on the latest snapshot of interaction with a [Stream].
本质是一个带有对stream 监听器 [StreamSubscription] 的 [StatefulWidget] 
- initialData：初始化数据
- Stream<T> stream ：监听的 stream 
- @required builder：返回的视图
```
class SimpleStreamPage extends StatelessWidget {
  StreamController _controller = StreamController();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleStreamPage'),
      ),
      body: Center(
          child: StreamBuilder(
              initialData: count,
              stream: _controller.stream,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sink.add(count++);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```
源码中的例子，可以监听 stream 当前的状态
```dart
/// StreamBuilder<int>(
///   stream: _lot?.bids, // a Stream<int> or null
///   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
///     if (snapshot.hasError)
///       return Text('Error: ${snapshot.error}');
///     switch (snapshot.connectionState) {
///       case ConnectionState.none: return Text('Select lot');
///       case ConnectionState.waiting: return Text('Awaiting bids...');
///       case ConnectionState.active: return Text('\$${snapshot.data}');
///       case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
///     }
///     return null; // unreachable
///   },
/// )
```

### FocusScope
FocusScope.of(context).requestFocus(FocusNode());//关闭软键盘

### FocusNode 
A leaf node in the focus tree that can receive focus.

### KeyedSubtree  extends StatelessWidget
A widget that builds its child.
Useful for attaching a key to an existing widget.
- Key key：(ValueKey)
- @required child
 
### Material
A piece of material.修饰性组件，给子组件赋予一些属性，
注意：有时可能会遇到 文字变形等与主样式 不一致的问题，可用 Material 包裹解决
- type = MaterialType.canvas, `The kind of material to show (e.g., card or canvas). This
affects the shape of the widget, the roundness of its corners if
the shape is rectangular, and the default color.`
- elevation = 0.0,
- color,
- shadowColor = const Color(0xFF000000),
- textStyle,
- borderRadius,
- shape,
- clipBehavior = Clip.none,
- animationDuration = kThemeChangeDuration,
- child,


