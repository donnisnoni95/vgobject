module gi

pub struct Repository {
	c &C.GIRepository
}

const (
	repository_load_flag_lazy = C.G_IREPOSITORY_LOAD_FLAG_LAZY
)

pub fn get_default_repository() &Repository {
	repository := C.g_irepository_get_default()
	if isnil(repository) { return 0 }
	return &Repository{repository}
}

// GOptionGroup *C.g_irepository_get_option_group (void)

pub fn prepend_repository_search_path(path string) {
	C.g_irepository_prepend_search_path(path.str)
} 

pub fn prepend_repository_library_path(path string) {
	C.g_irepository_prepend_library_path(path.str)
}

pub fn get_repository_search_path() []string {
	paths := C.g_irepository_get_search_path()
	return gslist_gstring_to_array_string(paths)
}

/* METHODS */

pub fn (r &Repository) get_dependencies(namespace string) []string {
	deps := C.g_irepository_get_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(deps)
}

pub fn (r &Repository) get_immediate_dependencies(namespace string) []string {
	deps := C.g_irepository_get_immediate_dependencies(r.c, namespace.str)
	return carray_string_to_array_string(deps)
}

pub fn (r &Repository) get_loaded_namespaces() []string {
	namespaces := C.g_irepository_get_loaded_namespaces(r.c)
	return carray_string_to_array_string(namespaces)
}

pub fn (r &Repository) get_n_infos(namespace string) int {
	return C.g_irepository_get_n_infos(r.c, namespace.str)
}

pub fn (r &Repository) get_info(namespace string, index int) &BaseInfo {
	info := C.g_irepository_get_info(r.c, namespace.str, index)
	return &BaseInfo{info}
}

pub fn (r &Repository) enumerate_versions(namespace string) []string {
	versions := C.g_irepository_enumerate_versions(r.c, namespace.str)
	return glist_gstring_to_array_string(versions)
}

pub fn (r &Repository) load_typelib(typelib Typelib) ?string {
	err := &C.GError(0)
	typelib_ := C.g_irepository_load_typelib(r.c, typelib.c, 0, &err)
	if err != 0 {
		return error(tos3(err.message))
	}
	return tos3(typelib_)
}

pub fn (r &Repository) get_typelib_path(namespace string) string {
	path := C.g_irepository_get_typelib_path(r.c, namespace.str)
	return tos_and_free(path)
}

pub fn (r &Repository) is_registered(namespace string, version string) bool {
	if version == '' {
		return C.g_irepository_is_registered(r.c, namespace.str, 0)
	}
	return C.g_irepository_is_registered(r.c, namespace.str, version.str)
}

pub fn (r &Repository) require(namespace string, version string/* , flags int */) ?&Typelib {
	err := &C.GError(0)
	typelib := if version != '' {
		C.g_irepository_require(r.c, namespace.str, version.str, 1, &err)
	} else {
		C.g_irepository_require(r.c, namespace.str, 0, 1, &err)
	}
	if err != 0 {
		return error(tos3(err.message))
	}
	return &Typelib{typelib}
}

// TODO
// pub fn (r &Repository) require_private(path, namespace, version string, flags int) (&Typelib, error) {
	
// }

pub fn (r &Repository) get_c_prefix(namespace string) string {
	c_prefix := C.g_irepository_get_c_prefix(r.c, namespace.str)
	return tos_and_free(c_prefix)
}

pub fn (r &Repository) get_shared_library(namespace string) string {
	shlib := C.g_irepository_get_shared_library(r.c, namespace.str)
	return tos_and_free(shlib)
}

pub fn (r &Repository) get_version(namespace string) string {
	version := C.g_irepository_get_version(r.c, namespace.str)
	return tos_and_free(version)
}

pub fn (r &Repository) find_by_gtype(gtype int) &BaseInfo {
	base_info := C.g_irepository_find_by_gtype(r.c, gtype)
	return &BaseInfo{base_info}
}

// GIEnumInfo * C.g_irepository_find_by_error_domain 	(GIRepository *repository,
//                                     				GQuark domain)

pub fn (r &Repository) find_by_name(namespace string, name string) &BaseInfo {
	base_info := C.g_irepository_find_by_name(r.c, namespace.str, name.str)
	return &BaseInfo{base_info}
}

// void C.g_irepository_get_object_gtype_interfaces	(GIRepository *repository,
//                                 					GType gtype,
//                                 					guint *n_interfaces_out,
//                                 					GIInterfaceInfo **interfaces_out)

pub fn (r &Repository) dump(arg string) bool {
	return C.g_irepository_dump(r.c, arg.str)
}
