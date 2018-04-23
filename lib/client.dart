class Client {
  final String email;
  final String name;
  final String lastName;
  final bool isPending;
  final bool isActive;

  Client(this.email, this.name, this.lastName, this.isPending, this.isActive);

  Client.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        lastName = json['last_name'],
        isPending = json['is_pending'],
        isActive = json['is_active'];
}
