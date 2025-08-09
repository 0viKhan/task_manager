import 'package:flutter/cupertino.dart';  // ✅ Okay, but consider using material.dart for broader UI support
import 'app.dart';                        // ✅ Assuming app.dart contains Taskmanager widget

void main() {
  runApp(Taskmanager());                 // ❌ Missing `const`
}
