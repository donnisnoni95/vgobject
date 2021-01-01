module gi

pub struct PropertyInfo {
	c &C.GIPropertyInfo
}

pub type ParamFlags = int

const (
	param_readable 			= ParamFlags(C.G_PARAM_READABLE)
	param_writable 			= ParamFlags(C.G_PARAM_WRITABLE)
	param_readwrite 		= ParamFlags(C.G_PARAM_READWRITE)
	param_construct 		= ParamFlags(C.G_PARAM_CONSTRUCT)
	param_construct_only 	= ParamFlags(C.G_PARAM_CONSTRUCT_ONLY)
	param_lax_validation 	= ParamFlags(C.G_PARAM_LAX_VALIDATION)
	param_static_name 		= ParamFlags(C.G_PARAM_STATIC_NAME)
	// PARAM_STATIC_NICK 		= ParamFlags(C.G_PARAM_STATIC_NICK)
	// PARAM_STATIC_BLURB 		= ParamFlags(C.G_PARAM_STATIC_BLURB)
	// PARAM_EXPLICIT_NOTIFY 	= ParamFlags(C.G_PARAM_EXPLICIT_NOTIFY)
	// PARAM_DEPRECATED 		= ParamFlags(C.G_PARAM_DEPRECATED)
)

pub fn (pi &PropertyInfo) get_flags() ParamFlags {
	return C.g_property_info_get_flags(pi.c)
}

pub fn (pi &PropertyInfo) get_ownership_transfer() Transfer {
	return C.g_property_info_get_ownership_transfer(pi.c)
}

pub fn (pi &PropertyInfo) get_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_property_info_get_type(pi.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (pi &PropertyInfo) get_cptr() voidptr {
	return pi.c
}

/* Inherits from BaseInfo */

pub fn (pi &PropertyInfo) unref() {
	C.g_base_info_unref(pi.c)
}
