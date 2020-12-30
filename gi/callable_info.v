module gi

pub struct CallableInfo {
	c &C.GICallableInfo
}

pub fn (ci &CallableInfo) can_throw_gerror() bool {
	return C.g_callable_info_can_throw_gerror(ci.c)
}

pub fn (ci &CallableInfo) get_n_args() int {
	return C.g_callable_info_get_n_args(ci.c)
}

pub fn (ci &CallableInfo) get_arg(n int) &ArgInfo {
	cptr := &C.GIBaseInfo(C.g_callable_info_get_arg(ci.c, n))
	ptr := &BaseInfo{cptr}
	return &ArgInfo(ptr)
}

pub fn (ci &CallableInfo) get_caller_owns() Transfer {
	return C.g_callable_info_get_caller_owns(ci.c)
}

pub fn (ci &CallableInfo) get_instance_ownership_transfer() Transfer {
	return C.g_callable_info_get_instance_ownership_transfer(ci.c)
}

pub fn (ci &CallableInfo) get_return_attribute(name string) string {
	return tos_and_free(C.g_callable_info_get_return_attribute(ci.c, name.str))
}

pub fn (ci &CallableInfo) get_return_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_callable_info_get_return_type(ci.c))
	return &TypeInfo(cptr)
}

// gboolean C.g_callable_info_invoke(GICallableInfo *info,
//                         			gpointer function,
//                         			const GIArgument *in_args,
//                         			int n_in_args,
//                         			const GIArgument *out_args,
//                         			int n_out_args,
//                         			GIArgument *return_value,
//                         			gboolean is_method,
//                         			gboolean throws,
//                         			GError **error)

pub fn (ci &CallableInfo) is_method() bool {
	return C.g_callable_info_is_method(ci.c)
}

pub fn (ci &CallableInfo) iterate_return_attributes(cb fn(name string, value string)) {
	iter := &C.GIAttributeIter(0)
	name_ := ''
	value_ := ''
	for C.g_callable_info_iterate_return_attributes(ci.c, &iter, &name_.str, &value_.str) {
		cb(name_, value_)
	}
}

pub fn (ci &CallableInfo) load_arg(n int, arg &ArgInfo) {
	C.g_callable_info_load_arg(ci.c, n, arg.c)
}

pub fn (ci &CallableInfo) load_return_type(type_info &TypeInfo) {
	C.g_callable_info_load_return_type(ci.c, type_info.c)
}

pub fn (ci &CallableInfo) may_return_nil() bool {
	return C.g_callable_info_may_return_null(ci.c)
}

pub fn (ci &CallableInfo) skip_return() bool {
	return C.g_callable_info_skip_return(ci.c)
}

pub fn (ci &CallableInfo) is_valid() bool {
	return C.GI_IS_CALLABLE_INFO(ci.c)
}

pub fn (ci &CallableInfo) get_cptr() voidptr {
	return ci.c
}

/* Inherits from BaseInfo */

pub fn (ci &CallableInfo) unref() {
	C.g_base_info_unref(ci.c)
}
