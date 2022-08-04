// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String? name;
  final String? urlImagem;
  final String? userName;
  final String? skills;
  final bool isLast;

  const UserInfoWidget(
      {Key? key,
      this.name,
      this.urlImagem,
      this.userName,
      this.skills,
      this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipOval(
                  child: Image.network(
                    urlImagem ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : ${name ?? ""}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Text('Username : ${userName ?? ""}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Text('Skills : ${skills ?? ""}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!isLast) ...[
            SizedBox(height: 16),
            Divider(height: 3, color: Colors.grey),
          ],
        ],
      ),
    );
  }
}
