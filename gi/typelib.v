module gi

pub struct Typelib {
	c &C.GITypelib
}

pub fn new_typelib_from_memory(mem byteptr, size u32) ?&Typelib {
	error := &C.GError(0)
	typelib := C.g_typelib_new_from_memory(&mem, size, &error)
	if typelib == 0 {
		panic(tos3(error.message))
	}
	return &Typelib{typelib}
}

// pub fn new_typelib_from_const_memory(mem byteptr, size u32) ?&Typelib {
// 	error := &C.GError(0)
// 	typelib := C.g_typelib_new_from_const_memory(&mem, size, &error)
// 	if isnil(typelib) {
// 		panic(tos3(error.message))
// 	}
// 	return &Typelib{typelib}
// }

// GITypelib * C.g_typelib_new_from_mapped_file (GMappedFile *mfile,
//                                 				GError **error)

pub fn (tl &Typelib) free() {
	C.g_typelib_free(tl.c)
}

pub fn (tl &Typelib) get_symbol(symbol_name string) string {
	c_symbol := voidptr(0)
	loaded := C.g_typelib_symbol(tl.c, symbol_name.str, &c_symbol)
	if !loaded { return '' }
	symbol := charptr(c_symbol)
	return tos3(symbol)
}

pub fn (tl &Typelib) get_namespace() string {
	namespace := C.g_typelib_get_namespace(tl)
	return tos3(namespace)
}

/* Inherits from BaseInfo */

pub fn (tl &Typelib) unref() {
	C.g_base_info_unref(tl.c)
}
