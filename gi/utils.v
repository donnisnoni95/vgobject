module gi

fn gslist_gstring_to_array_string(_list &C.GSList) []string {
    mut ret := []string{}
    mut list := _list
    for !isnil(list)  {
        str := tos_clone(list.data)
        ret << str
        list = list.next
    }
    C.g_slist_free(_list)
    return ret
}

fn glist_gstring_to_array_string(_list &C.GList) []string {
    mut ret := []string{}
    mut list := _list
    for !isnil(list) {
        str := tos_clone(list.data)
        ret << str
        list = list.next
    }
    C.g_list_free(_list)
    return ret
}

fn carray_string_to_array_string(arr &charptr) []string {
    mut arr_str := []string{}
    if isnil(arr) { return arr_str }
    mut i := 0
    for {
       unsafe {
            elem := byteptr(arr[i])
            if elem == 0 { break }
            arr_str << tos_clone(elem)
            i++
       }
    }
    C.g_strfreev(arr)
    return arr_str
}

fn next_charptr(_s &charptr) &charptr {
    unsafe {
        mut s := _s
        return s++
    }
}

fn tos_and_free(ptr charptr) string {
    c_ptr := byteptr(ptr)
    ret := tos_clone(c_ptr)
    C.g_free(ptr)
    return ret
}
