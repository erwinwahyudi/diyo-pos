class Table {
  final int id;
  final String name;
  String status;

  Table({required this.id, required this.name, required this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Table copyWith({String? name, String? status}) {
    return Table(
      id: id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}
