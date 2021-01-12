const std = @import("std");

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});
}

pub const Button = extern struct {
    extern fn click(self: @This) c_void,
    extern fn inner_text(self: @This) []const u8,
}

extern fn AbstractButtonBinding(T: type) @TypeOf(T) {
    return extern struct {
        click: extern fn(*T) c_void,
        inner_text: extern fn(*T) callconv(.C) *const char,
        context: *T,
    };
}

extern fn engine_factory() [*c]c_void;
extern fn register_button(engine: [*c]c_void, button: [*c]c_void) callconv(.C) void;
extern fn click(engine: [*c]c_void) callconv(.C) void;
