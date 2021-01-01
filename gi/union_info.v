module gi

pub struct UnionInfo {
	c &C.GIUnionInfo
}

pub fn (ui &UnionInfo) get_n_fields() int {
	return C.g_union_info_get_n_fields(ui.c)
}

pub fn (ui &UnionInfo) get_field(n int) &FieldInfo {
	cptr := &C.GIBaseInfo(C.g_union_info_get_field(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &FieldInfo(ptr)
}

pub fn (ui &UnionInfo) get_n_methods() int {
	return C.g_union_info_get_n_methods(ui.c)
}

pub fn (ui &UnionInfo) get_method(n int) &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_union_info_get_method(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ui &UnionInfo) is_discriminated() bool {
	return C.g_union_info_is_discriminated(ui.c)
}

pub fn (ui &UnionInfo) discriminator_offset() int {
	return C.g_union_info_get_discriminator_offset(ui.c)
}

pub fn (ui &UnionInfo) discriminator_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_union_info_get_discriminator_type(ui.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ui &UnionInfo) get_discriminator(n int) &ConstantInfo {
	cptr := &C.GIBaseInfo(C.g_union_info_get_discriminator(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &ConstantInfo(ptr)
}

pub fn (ui &UnionInfo) find_method(name string) &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_union_info_find_method(ui.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ui &UnionInfo) get_size() u32 {
	return C.g_union_info_get_size(ui.c)
}

pub fn (ui &UnionInfo) get_alignment() u32 {
	return C.g_union_info_get_alignment(ui.c)
}

pub fn (ui &UnionInfo) get_cptr() voidptr {
	return ui.c
}

/* Inherits from BaseInfo */

pub fn (ui &UnionInfo) unref() {
	C.g_base_info_unref(ui.c)
}
