module gi

pub fn (gt C.GType) is_abstract() bool {
	return C.G_TYPE_IS_ABSTRACT(gt)
}

pub fn (gt C.GType) is_derived() bool {
	return C.G_TYPE_IS_DERIVED(gt)
}

pub fn (gt C.GType) is_fundamental() bool {
	return C.G_TYPE_IS_FUNDAMENTAL(gt)
}

pub fn (gt C.GType) is_value_type() bool {
	return C.G_TYPE_IS_VALUE_TYPE(gt)
}

pub fn (gt C.GType) has_value_table() bool {
	return C.G_TYPE_HAS_VALUE_TABLE(gt)
}

pub fn (gt C.GType) is_classed() bool {
	return C.G_TYPE_IS_CLASSED(gt)
}

pub fn (gt C.GType) is_instantiatable() bool {
	return C.G_TYPE_IS_INSTANTIATABLE(gt)
}

pub fn (gt C.GType) is_derivable() bool {
	return C.G_TYPE_IS_DERIVABLE(gt)
}

pub fn (gt C.GType) is_deep_derivable() bool {
	return C.G_TYPE_IS_DEEP_DERIVABLE(gt)
}

pub fn (gt C.GType) is_interface() bool {
	return C.G_TYPE_IS_INTERFACE(gt)
}
