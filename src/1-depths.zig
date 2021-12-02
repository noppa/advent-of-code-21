const std = @import("std");
const print = @import("std").debug.print;

pub fn main() anyerror!void {
    var file = try std.fs.cwd().openFile("./src/inputs/1.txt", .{});
    defer file.close();
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var buf: [1048]u8 = undefined;
    var prev: u32 = 0;
    var incr: u32 = 0;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        var num = try std.fmt.parseInt(u32, line, 10);
        if (prev != 0 and num > prev) {
            incr += 1;
        }
        prev = num;
    }
    var outputBuf: [6]u8 = undefined;
    var output = try std.fmt.bufPrint(&outputBuf, "{}", .{incr});
    print("{s}\n", .{output});
}
