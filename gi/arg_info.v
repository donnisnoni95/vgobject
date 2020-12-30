module gi

pub struct ArgInfo {
	c &C.GIArgInfo
}

pub type Direction	= int
pub type ScopeType	= int
pub type Transfer	= int

pub const (
	gi_direction_in		= Direction(C.GI_DIRECTION_IN)
	gi_direction_out	= Direction(C.GI_DIRECTION_OUT)
	gi_direction_inout	= Direction(C.GI_DIRECTION_INOUT)
)

pub const (
	scope_type_invalid	= ScopeType(C.GI_SCOPE_TYPE_INVALID)
	scope_type_call		= ScopeType(C.GI_SCOPE_TYPE_CALL)
	scope_type_async	= ScopeType(C.GI_SCOPE_TYPE_ASYNC)
	scope_type_notified	= ScopeType(C.GI_SCOPE_TYPE_NOTIFIED)
)

pub const (
	transfer_nothing	= Transfer(C.GI_TRANSFER_NOTHING)
	transfer_container	= Transfer(C.GI_TRANSFER_CONTAINER)
	transfer_everything	= Transfer(C.GI_TRANSFER_EVERYTHING)
)

pub fn (ai &ArgInfo) get_closure() int {
	return C.g_arg_info_get_closure(ai.c)
}

pub fn (ai &ArgInfo) get_destroy() int {
	return C.g_arg_info_get_destroy(ai.c)
}

pub fn (ai &ArgInfo) get_direction() Direction {
	return C.g_arg_info_get_direction(ai.c)
}

pub fn (ai &ArgInfo) get_ownership_transfer() Transfer {
	return C.g_arg_info_get_ownership_transfer(ai.c)
}

pub fn (ai &ArgInfo) get_scope() ScopeType {
	return C.g_arg_info_get_scope(ai.c)
}

pub fn (ai &ArgInfo) get_type() &TypeInfo {
	cptr := &C.GIBaseInfo(C.g_arg_info_get_type(ai.c))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ai &ArgInfo) load_type(type_info &TypeInfo) {
	C.g_arg_info_load_type(ai.c, type_info.c)
}

pub fn (ai &ArgInfo) may_be_null() bool {
	return C.g_arg_info_may_be_null(ai.c)
}

pub fn (ai &ArgInfo) is_caller_allocates() bool {
	return C.g_arg_info_is_caller_allocates(ai.c)
}

pub fn (ai &ArgInfo) is_optional() bool {
	return C.g_arg_info_is_optional(ai.c)
}

pub fn (ai &ArgInfo) is_return_value() bool {
	return C.g_arg_info_is_return_value(ai.c)
}

pub fn (ai &ArgInfo) is_skip() bool {
	return C.g_arg_info_is_skip(ai.c)
}

pub fn (ai &ArgInfo) get_cptr() voidptr {
	return ai.c
}

/* Inherits from BaseInfo */

pub fn (ai &ArgInfo) unref() {
	C.g_base_info_unref(ai.c)
}
