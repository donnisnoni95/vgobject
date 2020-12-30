module gi

pub struct VFuncInfo {
	c &C.GIVFuncInfo
}

pub type VFuncInfoFlags = int

const (
	vfunc_must_chain_up		= VFuncInfoFlags(C.GI_VFUNC_MUST_CHAIN_UP)
	vfunc_must_override		= VFuncInfoFlags(C.GI_VFUNC_MUST_OVERRIDE)
	vfunc_must_not_override	= VFuncInfoFlags(C.GI_VFUNC_MUST_NOT_OVERRIDE)
)

pub fn (vfi &VFuncInfo) get_flags() int {
	return C.g_vfunc_info_get_flags(vfi.c)
}

pub fn (vfi &VFuncInfo) get_offset() int {
	return C.g_vfunc_info_get_offset(vfi.c)
}

pub fn (vfi &VFuncInfo) get_signal() &SignalInfo {
	cptr := &C.GIBaseInfo(C.g_vfunc_info_get_signal(vfi.c))
	if isnil(cptr) { return 0 }
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

pub fn (vfi &VFuncInfo) get_invoker() &FunctionInfo {
	cptr := &C.GIBaseInfo(C.g_vfunc_info_get_invoker(vfi.c))
	if isnil(cptr) { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

// gpointer C.g_vfunc_info_get_address 	(GIVFuncInfo *info,
//										GType implementor_gtype,
//                           			GError **error)


// gboolean C.g_vfunc_info_invoke (GIVFuncInfo *info,
//                      		GType implementor,
//                      		const GIArgument *in_args,
//                      		int n_in_args,
//                      		const GIArgument *out_args,
//                      		int n_out_args,
//                      		GIArgument *return_value,
//                      		GError **error)

pub fn (vfi &VFuncInfo) get_cptr() voidptr {
	return vfi.c
}

/* Inherits from BaseInfo */

pub fn (vfi &VFuncInfo) unref() {
	C.g_base_info_unref(vfi.c)
}
