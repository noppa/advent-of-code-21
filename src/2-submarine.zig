const std = @import("std");
const print = @import("std").debug.print;

pub fn main() anyerror!void {
    var file = try std.fs.cwd().openFile("./src/inputs/2.txt", .{});
    defer file.close();
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    // var buf: [1048]u8 = undefined;
    // var mode: i3 = 0;

    // var output: [5]u8 = undefined;
    // _ = try in_stream.read(&output);
    // print("print {s}\n", .{output});

    while (true) {
      var direction_buf: [20]u8 = undefined;
      var slice = try in_stream.readUntilDelimiterOrEof(&direction_buf, ' ');
      var output = slice;
      print("print {s}\n", .{output});


      break;
      // if (mode == 0) {
      //   print("test\n", .{});
      //   mode = 1;
      // } else if (mode == 1) {
      //   var outputBuf: [1048]u8 = undefined;
      //   var output = try std.fmt.bufPrint(&outputBuf, "num {s}", .{part});
      //   print("print {s}\n", .{output});
      //   mode = 2;
      // } else if (mode == 2) {
      //   // var num = try std.fmt.parseInt(u32, part, 10);
      //   var outputBuf: [1048]u8 = undefined;
      //   var output = try std.fmt.bufPrint(&outputBuf, "direction {s}", .{part});
      //   print("print {s}\n", .{output});
      //   mode = 1;
      // }
    }
}
