module gi

// type U8		C.uint8_t
// type I32	C.int32_t

pub struct ConstantInfo {
	c &C.GIConstantInfo
}

pub fn (ci &ConstantInfo) get_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_constant_info_get_type(ci.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ci &ConstantInfo) get_value() voidptr {
	arg := C.GIArgument{}
	C.g_constant_info_get_value(ci.c, &arg)

	ti := ci.get_type()
	tag := ti.get_tag()
	match tag {
		type_tag_boolean	{ return &bool(&arg) }
		type_tag_int8		{ return &i8(&arg) }
		// TYPE_TAG_UINT8		{ return &u8(&arg) }
		type_tag_int16		{ return &i16(&arg) }
		type_tag_uint16		{ return &u16(&arg) }
		// TYPE_TAG_INT32		{ return &i32(&arg) }
		type_tag_uint32		{ return &u32(&arg) }
		type_tag_int64		{ return &i64(&arg) }
		type_tag_uint64		{ return &u64(&arg) }
		type_tag_float		{ return &f32(&arg) }
		type_tag_double		{ return &f64(&arg) }
		type_tag_utf8, type_tag_filename {
			return &charptr(&arg)
		}
		else {
			eprintln('unsupported constant value')
			return voidptr(0) 
		}
	}

} 

pub fn (ci &ConstantInfo) get_cptr() voidptr {
	return ci.c
}

/* Inherits from BaseInfo */

pub fn (ci &ConstantInfo) unref() {
	C.g_base_info_unref(ci.c)
}
