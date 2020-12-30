module gi

pub struct FieldInfo {
	c &C.GIFieldInfo
}

pub type FieldInfoFlags = int

pub const (
	field_is_readable = FieldInfoFlags(C.GI_FIELD_IS_READABLE)
	field_is_writable = FieldInfoFlags(C.GI_FIELD_IS_WRITABLE)
)

pub fn (fi &FieldInfo) get_field(mem voidptr, arg &C.GIArgument) bool {
	return C.g_field_info_get_field(fi.c, mem, arg)
}

pub fn (fi &FieldInfo) set_field(mem voidptr, arg &C.GIArgument) bool {
	return C.g_field_info_set_field(fi.c, mem, arg)
}

pub fn (fi &FieldInfo) get_flags() FieldInfoFlags {
	return C.g_field_info_get_flags(fi.c)
}

pub fn (fi &FieldInfo) get_offset() int {
	return C.g_field_info_get_offset(fi.c)
}

pub fn (fi &FieldInfo) get_size() int {
	return C.g_field_info_get_size(fi.c)
}

pub fn (fi &FieldInfo) get_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_field_info_get_type(fi.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (fi &FieldInfo) get_cptr() voidptr {
	return fi.c
}

/* Inherits from BaseInfo */

pub fn (fi &FieldInfo) unref() {
	C.g_base_info_unref(fi.c)
}
