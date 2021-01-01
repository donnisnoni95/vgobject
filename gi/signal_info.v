module gi

pub type SignalFlags = int

const (
	signal_run_first	= SignalFlags(C.G_SIGNAL_RUN_FIRST)
	signal_run_last		= SignalFlags(C.G_SIGNAL_RUN_LAST)
	signal_run_cleanup	= SignalFlags(C.G_SIGNAL_RUN_CLEANUP)
	signal_no_recurse	= SignalFlags(C.G_SIGNAL_NO_RECURSE)
	signal_detailed		= SignalFlags(C.G_SIGNAL_DETAILED)
	signal_action		= SignalFlags(C.G_SIGNAL_ACTION)
	signal_no_hooks		= SignalFlags(C.G_SIGNAL_NO_HOOKS)
	signal_must_collect = SignalFlags(C.G_SIGNAL_MUST_COLLECT)
	signal_deprecated	= SignalFlags(C.G_SIGNAL_DEPRECATED)
)

pub struct SignalInfo {
	c &C.GISignalInfo
}

pub fn (si &SignalInfo) get_flags() SignalFlags {
	return C.g_signal_info_get_flags(si.c)
}

pub fn (si &SignalInfo) get_class_closure() &VFuncInfo {
	clls := C.g_signal_info_get_class_closure(si.c)
	if clls == 0 { return 0 }
	cptr := &C.GIBaseInfo(clls)
	ptr := &BaseInfo{cptr}
	return &VFuncInfo(ptr)
}

pub fn (si &SignalInfo) true_stops_emit() bool {
	return C.g_signal_info_true_stops_emit(si.c)
}

pub fn (si &SignalInfo) get_cptr() voidptr {
	return si.c
}

/* Inherits from BaseInfo */

pub fn (si &SignalInfo) unref() {
	C.g_base_info_unref(si.c)
}
