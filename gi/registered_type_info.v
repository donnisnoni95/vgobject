module gi

pub struct RegisteredTypeInfo {
	c &C.GIRegisteredTypeInfo
}

pub fn (rti &RegisteredTypeInfo) get_type_name() string {
	type_name := C.g_registered_type_info_get_type_name(rti.c)
	return tos3(type_name)
}

pub fn (rti &RegisteredTypeInfo) get_type_init() string {
	type_init := C.g_registered_type_info_get_type_init(rti.c)
	return tos3(type_init)
}

pub fn (rti &RegisteredTypeInfo) get_g_type() C.GType {
	return C.g_registered_type_info_get_g_type(rti.c)
}

pub fn (rti &RegisteredTypeInfo) get_cptr() voidptr {
	return rti.c
}

/* Inherits from BaseInfo */

pub fn (rti &RegisteredTypeInfo) unref() {
	C.g_base_info_unref(rti.c)
}
