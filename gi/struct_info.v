module gi

pub struct StructInfo {
	c &C.GIStructInfo
}

pub fn (si &StructInfo) find_field(name string) &FieldInfo {
	cptr := &C.GIBaseInfo(C.g_struct_info_find_field(si.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FieldInfo(ptr)
}

pub fn (si &StructInfo) get_alignment() u32 {
	return C.g_struct_info_get_alignment(si.c)
}

pub fn (si &StructInfo) get_size() u32 {
	return C.g_struct_info_get_size(si.c)
}

pub fn (si &StructInfo) is_gtype_struct() bool {
	return C.g_struct_info_is_gtype_struct(si.c)
}

pub fn (si &StructInfo) is_foreign() bool {
	return C.g_struct_info_is_foreign(si.c)
}

pub fn (si &StructInfo) get_n_fields() int {
	return C.g_struct_info_get_n_fields(si.c)
}

pub fn (si &StructInfo) get_field(n int) &FieldInfo {
	cptr := &C.GIBaseInfo(C.g_struct_info_get_field(si.c, n))
	ptr := &BaseInfo{cptr}
	return &FieldInfo(ptr)
}

pub fn (si &StructInfo) get_n_methods() int {
	return C.g_struct_info_get_n_methods(si.c)
}

pub fn (si &StructInfo) get_method(n int) &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_struct_info_get_method(si.c, n))
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (si &StructInfo) find_method(name string) &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_struct_info_find_method(si.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (si &StructInfo) get_cptr() voidptr {
	return si.c
}

/* Inherits from BaseInfo */

pub fn (si &StructInfo) unref() {
	C.g_base_info_unref(si.c)
}
