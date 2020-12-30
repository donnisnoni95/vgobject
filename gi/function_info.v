module gi

pub struct FunctionInfo {
	c &FunctionInfo
}

pub type FunctionInfoFlags = int

pub const (
	function_is_method      = FunctionInfoFlags(C.GI_FUNCTION_IS_METHOD)
	function_is_constructor = FunctionInfoFlags(C.GI_FUNCTION_IS_CONSTRUCTOR)
	function_is_getter      = FunctionInfoFlags(C.GI_FUNCTION_IS_GETTER)
	function_is_setter      = FunctionInfoFlags(C.GI_FUNCTION_IS_SETTER)
	function_wraps_vfunc    = FunctionInfoFlags(C.GI_FUNCTION_WRAPS_VFUNC)
	function_throws         = FunctionInfoFlags(C.GI_FUNCTION_THROWS)
)

pub fn (fi &FunctionInfo) get_flags() FunctionInfoFlags {
	return C.g_function_info_get_flags(fi.c)
}

pub fn (fi &FunctionInfo) get_property() &PropertyInfo {
	cptr := &C.GIBaseInfo(C.g_function_info_get_property(fi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &PropertyInfo(ptr)
}

pub fn (fi &FunctionInfo) get_symbol() string {
	symbol := C.g_function_info_get_symbol(fi.c)
	return tos3(symbol)
}

pub fn (fi &FunctionInfo) get_vfunc() &VFuncInfo {
	cptr := &C.GIBaseInfo(C.g_function_info_get_vfunc(fi.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

//gboolean	C.g_function_info_invoke (GIFunctionInfo *info,
//									const GIArgument *in_args,
//									int n_in_args,
//									const GIArgument *out_args,
//									int n_out_args,
//									GIArgument *return_value,
//									GError **error)

pub fn (fi &FunctionInfo) is_valid() bool {
	return C.GI_IS_FUNCTION_INFO(fi.c)
}

pub fn (fi &FunctionInfo) get_cptr() voidptr {
	return fi.c
}

/* Inherits from BaseInfo */

pub fn (fi &FunctionInfo) unref() {
	C.g_base_info_unref(fi.c)
}
