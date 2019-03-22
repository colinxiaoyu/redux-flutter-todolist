import 'package:redux/redux.dart';
import 'package:flutter/foundation.dart';

class ToDoState {
  String uniqueId;
  String title;
  String desc;
  bool isDone;
  List<String> todo;

  ToDoState(
      {this.uniqueId,
      this.title = '',
      this.desc = '',
      this.isDone = false,
      this.todo = const ['Do noting']}) {
    uniqueId ??= DateTime.now().toIso8601String();
  }

  @override
  String toString() {
    return 'ToDoState{uniqueId: $uniqueId, title: $title, desc: $desc, isDone: $isDone}';
  }
}

///操作的对象
class TodoList {
  List<ToDoState> list;

  static List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '11',
      title: 'List 上拉刷新，下拉加载等',
      desc: 'List 从网络获取数据，渲染页面等一系列交互',
      isDone: false,
      todo: ['PullOnLoading','PullToRefresh'],
    ),
    ToDoState(
      uniqueId: '0',
      title: 'AnimatedContainerDemo',
      desc: '基础动画',
      isDone: true,
      todo: ['AnimatedContainerDemo'],
    ),
    ToDoState(
      uniqueId: '1',
      title: 'AnimatedCrossFadeDemo',
      desc: '两个组件 交叉 淡入淡出',
      isDone: true,
      todo: ['AnimatedCrossFadeDemo'],
    ),
    ToDoState(
      uniqueId: '2.0',
      title: '重点HideBottomBarDemo',
      desc: 'listview上下滑动时自动隐藏 底部 \n'
        '需要掌握 AnimatedBuilder Animation.animate 等动画\n'
          '官网例子 Spinner',
      todo: ['HideBottomBarDemo','SpinnerDemo'],
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2.1',
      title: 'CustomRouteFirstPage',
      desc: '两个页面切换 路由 重写路由动画',
      isDone: true,
      todo: ['CustomRouteFirstPage'],
    ),
    ToDoState(
        uniqueId: '2.2',
        title: 'DraggableDemo',
        desc: '拖拽动画',
        isDone: true,
        todo: ['DraggableDemo'],
    ),
    ToDoState(
      uniqueId: '3',
      title: 'HeroDemo',
      desc: '两个页面公用 一个 widget ，在切换页面时 widget 动态变化\n'
          'flutter 原生效果',
      isDone: true,
      todo: ['HeroDemo','HeroPhoto','HeroBasicStructure'],
    ),
    ToDoState(
      uniqueId: '4',
      title: 'AudioScreen',
      desc: '用 Stopwatch 实现Audio 播放 暂停的功能',
      isDone: false,
      todo: ['AudioScreen'],
    ),
    ToDoState(
      uniqueId: '5',
      title: 'Stream',
      desc: 'stream 相关应用 \n 基于 stream 有一个 Provide 框架 可以看看',
      isDone: false,
      todo: ['SimpleStreamPage','IMPage'],
    ),
    ToDoState(
      uniqueId: '6',
      title: 'Material 包内其他组件',
      desc: 'Material 为我们提供了许多丰富的小 widget，同时也提供了许多已经封装好的成熟的 widget，值得学习',
      isDone: false,
      todo: ['SearchBarDemo','BottomAppBarDemo','ChipPage','ExpansionTileDemo','ExpansionPanelListDemo'],
    ),
    ToDoState(
      uniqueId: '7',
      title: 'Material 包内其他组件2',
      desc: '可上下扩展，伸缩的 Expansion ',
      isDone: false,
      todo: ['ExpansionTileDemo','ExpansionPanelListDemo'],
    ),
    ToDoState(
      uniqueId: '8',
      title: 'Material 包内其他组件3',
      desc: 'FrostedGlass 毛玻璃效果 ',
      isDone: true,
      todo: ['FrostedGlassDemo',],
    ),
    ToDoState(
      uniqueId: '8.1',
      title: 'BottomNavigation',
      desc: 'BottomNavigation 相关的例子 ',
      isDone: false,
      todo: ['BottomNavigationWidget','BottomNavigationKeepAlive'],
    ),
    ToDoState(
      uniqueId: '9',
      title: 'IntroViewDemo',
      desc: '第三方库 intro_views_flutter: ^2.4.0 超炫的动画效果 ',
      isDone: true,
      todo: ['IntroViewDemo',],
    ),
    ToDoState(
      uniqueId: '10',
      title: 'KeepAlive',
      desc: 'KeepAliveDemo  页面切换时，保持页面的状态不消失  ',
      isDone: true,
      todo: ['KeepAliveDemo','BottomNavigationKeepAlive'],
    ),
    ToDoState(
      uniqueId: '10',
      title: 'OverlayDemo',
      desc: 'Overla 相关API 以及注意事项',
      isDone: true,
      todo: ['OverlayDemo','OverlayDemo2'],
    ),

  ];

  TodoList({this.list});
}

///变更是否完成状态
class ChangeAction {
  ToDoState todo;

  ChangeAction({this.todo});
}

class ChangeTitleAction {
  ToDoState todo;

  ChangeTitleAction({this.todo});
}

///将对象与action 绑定
final todoListReducer = combineReducers<TodoList>([
  TypedReducer<TodoList, ChangeAction>(_change),
  TypedReducer<TodoList, ChangeTitleAction>(_changeTitle),
]);

///变更 是否完成的状态
TodoList _change(TodoList list, action) {
  list.list.forEach((item) {
    if (item.uniqueId == action.todo.uniqueId) {
      item.isDone = !item.isDone;
    }
  });
  return TodoList(list: list.list);
}

///变更 填写的title 和 desc,如果是新建的item 则在队尾重新创建item
TodoList _changeTitle(TodoList list, action) {
  bool hasUniqueId = true;
  list.list.forEach((item) {
    if (item.uniqueId == action.todo.uniqueId) {
      item.title = action.todo.title;
      item.desc = action.todo.desc;
      hasUniqueId = false;
    }
  });
  if (hasUniqueId) {
    list.list.add(action.todo);
  }
  return TodoList(list: list.list);
}
