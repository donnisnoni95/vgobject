module gi

pub struct TypeInfo {
	c &C.GITypeInfo
}

pub type ArrayType	= int
pub type TypeTag	= int

const (
	array_type_c          = ArrayType(C.GI_ARRAY_TYPE_C)
	array_type_array      = ArrayType(C.GI_ARRAY_TYPE_ARRAY)
	array_type_ptr_array  = ArrayType(C.GI_ARRAY_TYPE_PTR_ARRAY)
	array_type_byte_array = ArrayType(C.GI_ARRAY_TYPE_BYTE_ARRAY)
)

pub const (
	type_tag_void      = TypeTag(C.GI_TYPE_TAG_VOID)
	type_tag_boolean   = TypeTag(C.GI_TYPE_TAG_BOOLEAN)
	type_tag_int8      = TypeTag(C.GI_TYPE_TAG_INT8)
	type_tag_uint8     = TypeTag(C.GI_TYPE_TAG_UINT8)
	type_tag_int16     = TypeTag(C.GI_TYPE_TAG_INT16)
	type_tag_uint16    = TypeTag(C.GI_TYPE_TAG_UINT16)
	type_tag_int32     = TypeTag(C.GI_TYPE_TAG_INT32)
	type_tag_uint32    = TypeTag(C.GI_TYPE_TAG_UINT32)
	type_tag_int64     = TypeTag(C.GI_TYPE_TAG_INT64)
	type_tag_uint64    = TypeTag(C.GI_TYPE_TAG_UINT64)
	type_tag_float     = TypeTag(C.GI_TYPE_TAG_FLOAT)
	type_tag_double    = TypeTag(C.GI_TYPE_TAG_DOUBLE)
	type_tag_gtype     = TypeTag(C.GI_TYPE_TAG_GTYPE)
	type_tag_utf8      = TypeTag(C.GI_TYPE_TAG_UTF8)
	type_tag_filename  = TypeTag(C.GI_TYPE_TAG_FILENAME)
	type_tag_array     = TypeTag(C.GI_TYPE_TAG_ARRAY)
	type_tag_interface = TypeTag(C.GI_TYPE_TAG_INTERFACE)
	type_tag_glist     = TypeTag(C.GI_TYPE_TAG_GLIST)
	type_tag_gslist    = TypeTag(C.GI_TYPE_TAG_GSLIST)
	type_tag_ghash     = TypeTag(C.GI_TYPE_TAG_GHASH)
	type_tag_error     = TypeTag(C.GI_TYPE_TAG_ERROR)
	type_tag_unichar   = TypeTag(C.GI_TYPE_TAG_UNICHAR)
)

pub fn (ti &TypeInfo) is_pointer() bool {
	return C.g_type_info_is_pointer(ti.c)
}

pub fn (ti &TypeInfo) get_tag() TypeTag{
	return C.g_type_info_get_tag(ti.c)
}

pub fn (ti &TypeInfo) get_param_type(n int) &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_type_info_get_param_type(ti.c, n))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ti &TypeInfo) get_interface() &BaseInfo {
	cptr := C.g_type_info_get_interface(ti.c)
	return &BaseInfo{cptr}
}

pub fn (ti &TypeInfo) get_array_length() int {
	return C.g_type_info_get_array_length(ti.c)
}

pub fn (ti &TypeInfo) get_array_fixed_size() int {
	return C.g_type_info_get_array_fixed_size(ti.c)
}

pub fn (ti &TypeInfo) is_zero_terminated() bool {
	return C.g_type_info_is_zero_terminated(ti.c)
}

pub fn (ti &TypeInfo) get_array_type() ArrayType {
	return C.g_type_info_get_array_type(ti.c)
}

pub fn (ti &TypeInfo) get_cptr() voidptr {
	return ti.c
}

pub fn (tt TypeTag) str() string {
	return tos3(C.g_type_tag_to_string(tt))
}

/* Inherits from BaseInfo */

pub fn (tt &TypeInfo) unref() {
	C.g_base_info_unref(tt.c)
}
