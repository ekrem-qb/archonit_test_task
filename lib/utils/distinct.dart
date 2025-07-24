/// Skips data events if they are equal to
/// the previous data event
Stream<E> distinct<E>(
  final Stream<E> events,
  final Stream<E> Function(E) mapper,
) => events.distinct().asyncExpand(mapper);
