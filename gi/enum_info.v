module gi

pub struct EnumInfo {
	c &C.GIEnumInfo
}

pub fn (ei &EnumInfo) get_n_values() int {
	return C.g_enum_info_get_n_values(ei.c)
}

pub fn (ei &EnumInfo) get_value(n int) &ValueInfo {
	cptr := &C.GIBaseInfo(C.g_enum_info_get_value(ei.c, n))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &ValueInfo(ptr)
}

pub fn (ei &EnumInfo) get_n_methods() int {
	return C.g_enum_info_get_n_methods(ei.c)
}

pub fn (ei &EnumInfo) get_method(n int) &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_enum_info_get_method(ei.c, n))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ei &EnumInfo) get_storage_type() int /* GITypeTag */ {
	return C.g_enum_info_get_storage_type(ei.c)
}

pub fn (ei &EnumInfo) get_error_domain() string {
	return tos3(C.g_enum_info_get_error_domain(ei.c))
}

pub fn (ei &EnumInfo) is_valid() bool {
	return C.GI_IS_ENUM_INFO(ei.c)
}

pub fn (ei &EnumInfo) get_cptr() voidptr {
	return ei.c
}

/* Inherits from BaseInfo */

pub fn (ei &EnumInfo) unref() {
	C.g_base_info_unref(ei.c)
}
