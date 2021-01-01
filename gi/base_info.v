module gi

pub struct BaseInfo {
	c &C.GIBaseInfo
}

pub type InfoType  = int

pub const (
	info_type_invalid		= InfoType(C.GI_INFO_TYPE_INVALID)
	info_type_function		= InfoType(C.GI_INFO_TYPE_FUNCTION)
	info_type_callback		= InfoType(C.GI_INFO_TYPE_CALLBACK)
	info_type_struct		= InfoType(C.GI_INFO_TYPE_STRUCT)
	info_type_boxed			= InfoType(C.GI_INFO_TYPE_BOXED)
	info_type_enum			= InfoType(C.GI_INFO_TYPE_ENUM)
	info_type_flags			= InfoType(C.GI_INFO_TYPE_FLAGS)
	info_type_object		= InfoType(C.GI_INFO_TYPE_OBJECT)
	info_type_interface		= InfoType(C.GI_INFO_TYPE_INTERFACE)
	info_type_constant		= InfoType(C.GI_INFO_TYPE_CONSTANT)
	info_type_invalid_0		= InfoType(C.GI_INFO_TYPE_INVALID_0)
	info_type_union			= InfoType(C.GI_INFO_TYPE_UNION)
	info_type_value			= InfoType(C.GI_INFO_TYPE_VALUE)
	info_type_signal		= InfoType(C.GI_INFO_TYPE_SIGNAL)
	info_type_vfunc			= InfoType(C.GI_INFO_TYPE_VFUNC)
	info_type_property		= InfoType(C.GI_INFO_TYPE_PROPERTY)
	info_type_field			= InfoType(C.GI_INFO_TYPE_FIELD)
	info_type_arg			= InfoType(C.GI_INFO_TYPE_ARG)
	info_type_type			= InfoType(C.GI_INFO_TYPE_TYPE)
	info_type_unresolved	= InfoType(C.GI_INFO_TYPE_UNRESOLVED)
)

pub fn new_base_info(type_ InfoType, container &BaseInfo, typelib &Typelib, offset u32) &BaseInfo {
	base_info := C.g_info_new(type_, container.c, typelib.c, offset)
	return &BaseInfo{base_info}
}

pub fn (bi &BaseInfo) ref() &BaseInfo {
	base_info := C.g_base_info_ref(bi.c)
	return &BaseInfo{base_info}
}

pub fn (bi &BaseInfo) unref() {
	C.g_base_info_unref(bi.c)
}

pub fn (bi &BaseInfo) equal(base_info &BaseInfo) bool{
	return C.g_base_info_equal(bi.c, base_info.c)
}

pub fn (bi &BaseInfo) get_type() InfoType {
	return C.g_base_info_get_type(bi.c)
}

pub fn (bi &BaseInfo) get_typelib() &Typelib {
	typelib := C.g_base_info_get_typelib(bi.c)
	return &Typelib{typelib}
}

pub fn (bi &BaseInfo) get_namespace() string {
	namespace := C.g_base_info_get_namespace(bi.c)
	if isnil(namespace) { return '' }
	return tos3(namespace)
}

pub fn (bi &BaseInfo) get_name() string {
	name := C.g_base_info_get_name(bi.c)
	return tos3(name)
}

pub fn (bi &BaseInfo) get_attribute(name string) string {
	attribute := C.g_base_info_get_attribute(bi.c, name.str)
	return tos3(attribute)
}

pub fn (bi &BaseInfo) iterate_attributes(cb fn(name string, value string)) {
	iter := &C.GIAttributeIter(0)
	name_ := ''
	value_ := ''
	for C.g_base_info_iterate_attributes(bi.c, &iter, &name_.str, &value_.str) {
		cb(name_, value_)
	}
}

pub fn (bi &BaseInfo) get_container() &BaseInfo {
	container := C.g_base_info_get_container(bi.c)
	return &BaseInfo{container}
}

pub fn (bi &BaseInfo) is_deprecated() bool {
	return C.g_base_info_is_deprecated(bi.c)
}

pub fn (it InfoType) str() string {
	return tos3(C.g_info_type_to_string(it))
}
