module gi

pub struct CallbackInfo {
	c &C.GICallbackInfo
}

/* Inherits from BaseInfo */

pub fn (ci &CallbackInfo) unref() {
	C.g_base_info_unref(ci.c)
}
