class Asset {
  const Asset({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.priceUsd,
  });

  final String id;
  final String rank;
  final String symbol;
  final String priceUsd;

  factory Asset.fromJson(final Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      priceUsd: json['priceUsd'],
    );
  }

  Asset copyWith({
    final String? id,
    final String? rank,
    final String? symbol,
    final String? priceUsd,
  }) {
    return Asset(
      id: id ?? this.id,
      rank: rank ?? this.rank,
      symbol: symbol ?? this.symbol,
      priceUsd: priceUsd ?? this.priceUsd,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'rank': rank, 'symbol': symbol, 'priceUsd': priceUsd};
  }

  @override
  String toString() {
    return '''Asset(id: $id, rank: $rank, symbol: $symbol, priceUsd: $priceUsd)''';
  }

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is Asset &&
        other.id == id &&
        other.rank == rank &&
        other.symbol == symbol &&
        other.priceUsd == priceUsd;
  }

  @override
  int get hashCode {
    return id.hashCode ^ rank.hashCode ^ symbol.hashCode ^ priceUsd.hashCode;
  }
}
