module gi

// C Structs
struct C.GIRepository
	struct C.GIBaseInfo
	struct C.GICallableInfo
		struct C.GIFunctionInfo
		struct C.GICallbackInfo
		struct C.GISignalInfo
		struct C.GIVFuncInfo
	struct C.GIRegisteredTypeInfo
		struct C.GIEnumInfo
		struct C.GIStructInfo
		struct C.GIUnionInfo
		struct C.GIObjectInfo
		struct C.GIInterfaceInfo
	struct C.GIArgInfo
	struct C.GIConstantInfo
	struct C.GIFieldInfo
	struct C.GIPropertyInfo
	struct C.GITypeInfo
	struct C.GIValueInfo


struct C.GITypelib
struct C.GIAttributeIter

[typedef]
struct C.GType{}

[typedef]
struct C.GIArgument

struct C.GOptionGroup

[typedef]
struct C.GError{
	message charptr
}

[typedef]
struct C.gchar

[typedef]
struct C.GSList {
	data voidptr
	next &C.GSList
}

[typedef]
struct C.GList {
	data voidptr
	next &C.GList
}

/* TYPELIB */
fn C.g_typelib_new_from_memory(byteptr, u32, &C.GError) &C.GITypelib
fn C.g_typelib_new_from_const_memory(byteptr, u32, &C.GError) &C.GITypelib
// fn C.g_typelib_new_from_mapped_file(&GMappedFile, &C.GError) &C.GITypelib
fn C.g_typelib_free(&C.GITypelib)
fn C.g_typelib_symbol(&C.GITypelib, charptr, voidptr) bool
fn C.g_typelib_get_namespace(&C.GITypelib) charptr

/* REPOSITORY */
fn C.g_irepository_get_default() &C.GIRepository
fn C.g_irepository_get_dependencies(&C.GIRepository, charptr) &charptr
fn C.g_irepository_get_immediate_dependencies(&C.GIRepository, charptr) &charptr
fn C.g_irepository_get_loaded_namespaces(&C.GIRepository) &charptr
fn C.g_irepository_get_n_infos(&C.GIRepository, charptr) int
fn C.g_irepository_get_info(&C.GIRepository, charptr, int) &C.GIBaseInfo
fn C.g_irepository_get_option_group() &GOptionGroup
fn C.g_irepository_enumerate_versions(&C.GIRepository, charptr) &C.GList
fn C.g_irepository_prepend_library_path(charptr)
fn C.g_irepository_prepend_search_path(charptr)
fn C.g_irepository_get_search_path() &C.GSList
fn C.g_irepository_load_typelib(&C.GIRepository, &C.GITypelib, int /* GIRepositoryLoadFlags */, &C.GError) charptr
fn C.g_irepository_get_typelib_path(&C.GIRepository, charptr) charptr
fn C.g_irepository_is_registered(&C.GIRepository, charptr, charptr) bool
fn C.g_irepository_require(&C.GIRepository, charptr, charptr, int /* GIRepositoryLoadFlags */, &C.GError) &C.GITypelib
fn C.g_irepository_require_private(&C.GIRepository, charptr, charptr, charptr, int /* GIRepositoryLoadFlags */, &C.GError) &C.GITypelib
fn C.g_irepository_get_c_prefix(&C.GIRepository, charptr) charptr
fn C.g_irepository_get_shared_library(&C.GIRepository, charptr) charptr
fn C.g_irepository_get_version(&C.GIRepository, charptr) charptr
fn C.g_irepository_find_by_gtype(&C.GIRepository, C.GType) &C.GIBaseInfo
fn C.g_irepository_find_by_error_domain(&C.GIRepository, u32 /* GQuark */) &C.GIEnumInfo
fn C.g_irepository_find_by_name(&C.GIRepository, charptr, charptr) &C.GIBaseInfo
fn C.g_irepository_get_object_gtype_interfaces(&C.GIRepository, C.GType, &u32, voidptr)
fn C.g_irepository_dump(charptr, &C.GError) bool

/* BASE INFO */
fn C.g_info_new(int /* GIInfoType */, &C.GIBaseInfo, &C.GITypelib, u32) &C.GIBaseInfo 
fn C.g_base_info_ref(&C.GIBaseInfo) &C.GIBaseInfo
fn C.g_base_info_unref(&C.GIBaseInfo)
fn C.g_base_info_equal(&C.GIBaseInfo, &C.GIBaseInfo) bool
fn C.g_base_info_get_type(&C.GIBaseInfo) int // GIInfoType
fn C.g_base_info_get_typelib(&C.GIBaseInfo) &C.GITypelib
fn C.g_base_info_get_namespace(&C.GIBaseInfo) charptr
fn C.g_base_info_get_name(&C.GIBaseInfo) charptr
fn C.g_base_info_get_attribute(&C.GIBaseInfo, charptr) charptr
fn C.g_base_info_iterate_attributes(&C.GIBaseInfo, &C.GIAttributeIter, charptr, charptr) bool
fn C.g_base_info_get_container(&C.GIBaseInfo) &C.GIBaseInfo
fn C.g_info_type_to_string(int /* GIInfoType */) charptr
fn C.g_base_info_is_deprecated(&C.GIBaseInfo) bool

/* CALLABLE INFO */
fn C.GI_IS_CALLABLE_INFO(voidptr) bool
fn C.g_callable_info_can_throw_gerror(&C.GICallableInfo) bool
fn C.g_callable_info_get_n_args(&C.GICallableInfo) int
fn C.g_callable_info_get_arg(&C.GICallableInfo, int) &C.GIArgInfo
fn C.g_callable_info_get_caller_owns(&C.GICallableInfo) int // GITransfer
fn C.g_callable_info_get_instance_ownership_transfer(&C.GICallableInfo) int // GITransfer
fn C.g_callable_info_get_return_attribute(&C.GICallableInfo, charptr) charptr
fn C.g_callable_info_get_return_type(&C.GICallableInfo) &C.GITypeInfo
fn C.g_callable_info_invoke(&C.GICallableInfo, voidptr, &C.GIArgument, int, &C.GIArgument, int, &C.GIArgument, bool, bool, &C.GError) bool
fn C.g_callable_info_is_method(&C.GICallableInfo) bool
fn C.g_callable_info_iterate_return_attributes(&C.GICallableInfo, &C.GIAttributeIter, charptr, charptr) bool
fn C.g_callable_info_load_arg(&C.GICallableInfo, int, &C.GIArgInfo)
fn C.g_callable_info_load_return_type(&C.GICallableInfo, &C.GITypeInfo)
fn C.g_callable_info_may_return_null(&C.GICallableInfo) bool
fn C.g_callable_info_skip_return(&C.GICallableInfo) bool

/* ARG INFO */
fn C.g_arg_info_get_closure(&C.GIArgInfo) int
fn C.g_arg_info_get_destroy(&C.GIArgInfo) int
fn C.g_arg_info_get_direction(&C.GIArgInfo) int /* GIDirection */
fn C.g_arg_info_get_ownership_transfer(&C.GIArgInfo) int /* GITransfer */
fn C.g_arg_info_get_scope(&C.GIArgInfo) int /* GIScopeType */
fn C.g_arg_info_get_type(&C.GIArgInfo) &C.GITypeInfo
fn C.g_arg_info_load_type(&C.GIArgInfo, &C.GITypeInfo)
fn C.g_arg_info_may_be_null(&C.GIArgInfo) bool
fn C.g_arg_info_is_caller_allocates(&C.GIArgInfo) bool
fn C.g_arg_info_is_optional(&C.GIArgInfo) bool
fn C.g_arg_info_is_return_value(&C.GIArgInfo) bool
fn C.g_arg_info_is_skip(&C.GIArgInfo) bool

/* FUNCTION INFO */
fn C.GI_IS_FUNCTION_INFO(voidptr) bool
fn C.g_function_info_get_flags(&C.GIFunctionInfo) int /* GIFunctionInfoFlags */
fn C.g_function_info_get_property(&C.GIFunctionInfo) &C.GIPropertyInfo
fn C.g_function_info_get_symbol(&C.GIFunctionInfo) charptr
fn C.g_function_info_get_vfunc(&C.GIFunctionInfo) &C.GIVFuncInfo
fn C.g_function_info_invoke(&C.GIFunctionInfo, &C.GIArgument, int, &C.GIArgument, int, &C.GIArgument, &C.GError) bool

/* VFUNC INFO */
fn C.g_vfunc_info_get_flags(&C.GIVFuncInfo) int /* GIVFuncInfoFlags */
fn C.g_vfunc_info_get_offset(&C.GIVFuncInfo) int
fn C.g_vfunc_info_get_signal(&C.GIVFuncInfo) &C.GISignalInfo
fn C.g_vfunc_info_get_invoker(&C.GIVFuncInfo) &C.GIFunctionInfo
fn C.g_vfunc_info_get_address(&C.GIVFuncInfo, C.GType, &C.GError) voidptr
fn C.g_vfunc_info_invoke(&C.GIVFuncInfo, C.GType, &C.GIArgument, int, &C.GIArgument, int, &C.GIArgument, &C.GError) bool

/* PROPERTY INFO */
fn C.g_property_info_get_flags(&C.GIPropertyInfo) int /* GParamFlags */
fn C.g_property_info_get_ownership_transfer(&C.GIPropertyInfo) int /* GITransfer */
fn C.g_property_info_get_type(&C.GIPropertyInfo) &C.GITypeInfo

/* TYPE INFO */
fn C.g_type_info_is_pointer(&C.GITypeInfo) bool
fn C.g_type_info_get_tag(&C.GITypeInfo) int /* GITypeTag */
fn C.g_type_info_get_param_type(&C.GITypeInfo, int) &C.GITypeInfo
fn C.g_type_info_get_interface(&C.GITypeInfo) &C.GIBaseInfo
fn C.g_type_info_get_array_length(&C.GITypeInfo) int
fn C.g_type_info_get_array_fixed_size(&C.GITypeInfo) int
fn C.g_type_info_is_zero_terminated(&C.GITypeInfo) bool
fn C.g_type_info_get_array_type(&C.GITypeInfo) int /* GIArrayType */

/* CONSTANT INFO */
fn C.g_constant_info_free_value(&C.GIConstantInfo, &C.GIArgument)
fn C.g_constant_info_get_type(&C.GIConstantInfo) &C.GITypeInfo
fn C.g_constant_info_get_value(&C.GIConstantInfo, &C.GIArgument) int

/* SIGNAL INFO */
fn C.g_signal_info_get_flags(&C.GISignalInfo) int /* GSignalFlags */
fn C.g_signal_info_get_class_closure(&C.GISignalInfo) &C.GIVFuncInfo
fn C.g_signal_info_true_stops_emit(&C.GISignalInfo) bool

/* ENUM INFO */
fn C.GI_IS_VALUE_INFO(voidptr) bool
fn C.GI_IS_ENUM_INFO(voidptr) bool
fn C.g_enum_info_get_n_values(&C.GIEnumInfo) int
fn C.g_enum_info_get_value(&C.GIEnumInfo, int) &C.GIValueInfo
fn C.g_enum_info_get_n_methods(&C.GIEnumInfo) int
fn C.g_enum_info_get_method(&C.GIEnumInfo, int) &C.GIFunctionInfo
fn C.g_enum_info_get_storage_type(&C.GIEnumInfo) int /* GITypeTag */
fn C.g_enum_info_get_error_domain(&C.GIEnumInfo) charptr
fn C.g_value_info_get_value(&C.GIValueInfo) i64

/* OBJECT INFO */
fn C.g_object_info_get_abstract(&C.GIObjectInfo) bool
fn C.g_object_info_get_fundamental(&C.GIObjectInfo) bool
fn C.g_object_info_get_parent(&C.GIObjectInfo) &C.GIObjectInfo
fn C.g_object_info_get_type_name(&C.GIObjectInfo) charptr
fn C.g_object_info_get_type_init(&C.GIObjectInfo) charptr
fn C.g_object_info_get_n_constants(&C.GIObjectInfo) int
fn C.g_object_info_get_constant(&C.GIObjectInfo, int) &C.GIConstantInfo
fn C.g_object_info_get_n_fields(&C.GIObjectInfo) int
fn C.g_object_info_get_field(&C.GIObjectInfo, int) &C.GIFieldInfo
fn C.g_object_info_get_n_interfaces(&C.GIObjectInfo) int
fn C.g_object_info_get_interface(&C.GIObjectInfo, int) &C.GIInterfaceInfo
fn C.g_object_info_get_n_methods(&C.GIObjectInfo) int
fn C.g_object_info_get_method(&C.GIObjectInfo, int) &C.GIFunctionInfo
fn C.g_object_info_find_method(&C.GIObjectInfo, charptr) &C.GIFunctionInfo
fn C.g_object_info_find_method_using_interfaces(&C.GIObjectInfo, charptr, &C.GIObjectInfo) &C.GIFunctionInfo
fn C.g_object_info_get_n_properties(&C.GIObjectInfo) int
fn C.g_object_info_get_property(&C.GIObjectInfo, int) &C.GIPropertyInfo
fn C.g_object_info_get_n_signals(&C.GIObjectInfo) int
fn C.g_object_info_get_signal(&C.GIObjectInfo, int) &C.GISignalInfo
fn C.g_object_info_find_signal(&C.GIObjectInfo, charptr) &C.GISignalInfo
fn C.g_object_info_get_n_vfuncs(&C.GIObjectInfo) int
fn C.g_object_info_get_vfunc(&C.GIObjectInfo, int) &C.GIVFuncInfo
fn C.g_object_info_find_vfunc(&C.GIObjectInfo, charptr) &C.GIVFuncInfo
fn C.g_object_info_find_vfunc_using_interfaces(&C.GIObjectInfo, charptr, &C.GIObjectInfo) &C.GIVFuncInfo
fn C.g_object_info_get_class_struct(&C.GIObjectInfo) &C.GIStructInfo
fn C.g_object_info_get_ref_function(&C.GIObjectInfo) charptr
// fn C.g_object_info_get_ref_function_pointer(&C.GIObjectInfo) voidptr/* GIObjectInfoRefFunction */
fn C.g_object_info_get_unref_function(&C.GIObjectInfo) charptr
// fn C.g_object_info_get_unref_function_pointer(&C.GIObjectInfo) GIObjectInfoUnrefFunction
fn C.g_object_info_get_set_value_function(&C.GIObjectInfo)
// fn C.g_object_info_get_set_value_function_pointer(&C.GIObjectInfo) GIObjectInfoSetValueFunction
fn C.g_object_info_get_get_value_function(&C.GIObjectInfo)
// fn C.g_object_info_get_get_value_function_pointer(&C.GIObjectInfo) GIObjectInfoGetValueFunction

/* FIELD INFO */
fn C.g_field_info_get_field(&C.GIFieldInfo, voidptr, &C.GIArgument) bool
fn C.g_field_info_set_field(&C.GIFieldInfo, voidptr, &C.GIArgument) bool
fn C.g_field_info_get_flags(&C.GIFieldInfo) int /* GIFieldInfoFlags */
fn C.g_field_info_get_offset(&C.GIFieldInfo) int
fn C.g_field_info_get_size(&C.GIFieldInfo) int
fn C.g_field_info_get_type(&C.GIFieldInfo) &C.GITypeInfo

/* STRUCT INFO */
fn C.g_struct_info_find_field(&C.GIStructInfo, charptr) &C.GIFieldInfo
fn C.g_struct_info_get_alignment(&C.GIStructInfo) u32
fn C.g_struct_info_get_size(&C.GIStructInfo) u32
fn C.g_struct_info_is_gtype_struct(&C.GIStructInfo) bool
fn C.g_struct_info_is_foreign(&C.GIStructInfo) bool
fn C.g_struct_info_get_n_fields(&C.GIStructInfo) int
fn C.g_struct_info_get_field(&C.GIStructInfo, int) &C.GIFieldInfo
fn C.g_struct_info_get_n_methods(&C.GIStructInfo) int
fn C.g_struct_info_get_method(&C.GIStructInfo, int) &C.GIFunctionInfo
fn C.g_struct_info_find_method(&C.GIStructInfo, charptr) &C.GIFunctionInfo

/* REGISTERED TYPE INFO */
fn C.g_registered_type_info_get_type_name(&C.GIRegisteredTypeInfo) charptr
fn C.g_registered_type_info_get_type_init(&C.GIRegisteredTypeInfo) charptr
fn C.g_registered_type_info_get_g_type(&C.GIRegisteredTypeInfo) C.GType

/* INTERFACE INFO */
fn C.g_interface_info_get_n_prerequisites(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_prerequisite(&C.GIInterfaceInfo, int) &C.GIBaseInfo
fn C.g_interface_info_get_n_properties(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_property(&C.GIInterfaceInfo, int) &C.GIPropertyInfo
fn C.g_interface_info_get_n_methods(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_method(&C.GIInterfaceInfo, int) &C.GIFunctionInfo
fn C.g_interface_info_find_method(&C.GIInterfaceInfo, charptr) &C.GIFunctionInfo
fn C.g_interface_info_get_n_signals(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_signal(&C.GIInterfaceInfo, int) &C.GISignalInfo
fn C.g_interface_info_find_signal(&C.GIInterfaceInfo, charptr) &C.GISignalInfo
fn C.g_interface_info_get_n_vfuncs(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_vfunc(&C.GIInterfaceInfo, int) &C.GIVFuncInfo
fn C.g_interface_info_find_vfunc(&C.GIInterfaceInfo, charptr) &C.GIVFuncInfo
fn C.g_interface_info_get_n_constants(&C.GIInterfaceInfo) int
fn C.g_interface_info_get_constant(&C.GIInterfaceInfo, int) &C.GIConstantInfo
fn C.g_interface_info_get_iface_struct(&C.GIInterfaceInfo) &C.GIStructInfo

/* UNION INFO */
fn C.g_union_info_get_n_fields(&C.GIUnionInfo) int
fn C.g_union_info_get_field(&C.GIUnionInfo, int) &C.GIFieldInfo
fn C.g_union_info_get_n_methods(&C.GIUnionInfo) int
fn C.g_union_info_get_method(&C.GIUnionInfo, int) &C.GIFunctionInfo
fn C.g_union_info_is_discriminated(&C.GIUnionInfo) bool
fn C.g_union_info_get_discriminator_offset(&C.GIUnionInfo) int
fn C.g_union_info_get_discriminator_type(&C.GIUnionInfo) &C.GITypeInfo
fn C.g_union_info_get_discriminator(&C.GIUnionInfo, int) &C.GIConstantInfo
fn C.g_union_info_find_method(&C.GIUnionInfo, charptr) &C.GIFunctionInfo
fn C.g_union_info_get_size(&C.GIUnionInfo) u32
fn C.g_union_info_get_alignment(&C.GIUnionInfo) u32

// GTYPE
fn C.G_TYPE_IS_ABSTRACT(&C.GType) bool
fn C.G_TYPE_IS_DERIVED(&C.GType) bool
fn C.G_TYPE_IS_FUNDAMENTAL(&C.GType) bool
fn C.G_TYPE_IS_VALUE_TYPE(&C.GType) bool
fn C.G_TYPE_HAS_VALUE_TABLE(&C.GType) bool
fn C.G_TYPE_IS_CLASSED(&C.GType) bool
fn C.G_TYPE_IS_INSTANTIATABLE(&C.GType) bool
fn C.G_TYPE_IS_DERIVABLE(&C.GType) bool
fn C.G_TYPE_IS_DEEP_DERIVABLE(&C.GType) bool
fn C.G_TYPE_IS_INTERFACE(&C.GType) bool

fn C.g_type_tag_to_string(int) charptr

// UTILS
fn C.g_slist_length(&C.GSList) int
fn C.g_slist_free(&C.GSList)
fn C.g_list_free(&C.GList)
fn C.g_free(voidptr)
fn C.g_strfreev(&C.gchar)
