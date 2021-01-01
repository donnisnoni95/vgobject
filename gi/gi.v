module gi

#pkgconfig gobject-introspection-1.0

#include <girepository.h>

pub fn to_base_info(info voidptr) &BaseInfo {
	return &BaseInfo(info)
}

pub fn to_arg_info(info voidptr) &ArgInfo {
	return &ArgInfo(info)
}

pub fn to_constant_info(info voidptr) &ConstantInfo {
	return &ConstantInfo(info)
}

pub fn to_field_info(info voidptr) &FieldInfo {
	return &FieldInfo(info)
}

pub fn to_property_info(info voidptr) &PropertyInfo {
	return &PropertyInfo(info)
}

pub fn to_type_info(info voidptr) &TypeInfo {
	return &TypeInfo(info)
}

pub fn to_callable_info(info voidptr) &CallableInfo {
	return &CallableInfo(info)
}

pub fn to_function_info(info voidptr) &FunctionInfo {
	return &FunctionInfo(info)
}

pub fn to_signal_info(info voidptr) &SignalInfo {
	return &SignalInfo(info)
}

pub fn to_vfunc_info(info voidptr) &VFuncInfo {
	return &VFuncInfo(info)
}

pub fn to_registered_type(info voidptr) &RegisteredTypeInfo {
	return &RegisteredTypeInfo(info)
}

pub fn to_enum_info(info voidptr) &EnumInfo {
	return &EnumInfo(info)
}

pub fn to_interface_info(info voidptr) &InterfaceInfo {
	return &InterfaceInfo(info)
}

pub fn to_object_info(info voidptr) &ObjectInfo {
	return &ObjectInfo(info)
}

pub fn to_union_info(info voidptr) &UnionInfo {
	return &UnionInfo(info)
}
