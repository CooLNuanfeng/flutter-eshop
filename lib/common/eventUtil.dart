import 'package:event_bus/event_bus.dart';
import 'dart:async';

class CustomEvent {
  String name;
  dynamic value;
  CustomEvent(this.name, this.value);
}

class EventUtil {
  static EventBus _instance;
  static EventBus getInstance() {
    if (null == _instance) {
      _instance = new EventBus();
    }
    return _instance;
  }

  static Map<Type, List<StreamSubscription>> subscriptions = {};
  // 添加监听事件
  // [T] 事件泛型 必须要传
  // [onData] 接受到事件
  // [autoManaged] 自动管理实例，off 取消
  static StreamSubscription on<T extends CustomEvent>(void onData(T event),
      {Function onError,
      void onDone(),
      bool cancelOnError,
      bool autoManaged = true}) {
    StreamSubscription subscription = getInstance()?.on<T>()?.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    if (autoManaged == true) {
      if (subscriptions == null) subscriptions = {};
      List<StreamSubscription> subs = subscriptions[T.runtimeType] ?? [];
      subs.add(subscription);
      subscriptions[T.runtimeType] = subs;
    }
    return subscription;
  }

  // 移除监听者
  // [T] 事件泛型 必须要传
  // [subscription] 指定
  static void off<T extends Object>({StreamSubscription subscription}) {
    if (subscriptions == null) subscriptions = {};
    if (subscription != null) {
      // 移除传入的
      List<StreamSubscription> subs = subscriptions[T.runtimeType] ?? [];
      subs.remove(subscription);
      subscriptions[T.runtimeType] = subs;
    } else {
      // 移除全部
      subscriptions[T.runtimeType] = null;
    }
  }

  // 发送事件
  static void fire(CustomEvent event) {
    getInstance()?.fire(event);
  }
}
