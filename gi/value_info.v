module gi

pub struct ValueInfo {
	c &C.GIValueInfo
}

pub fn (vi &ValueInfo) get_value() i64 {
	return C.g_value_info_get_value(vi.c)
}

pub fn (vi &ValueInfo) is_valid() bool {
	return C.GI_IS_ENUM_INFO(vi.c)
}

pub fn (vi &ValueInfo) get_cptr() voidptr {
	return vi.c
}

/* Inherits from BaseInfo */

pub fn (vi &ValueInfo) unref() {
	C.g_base_info_unref(vi.c)
}
