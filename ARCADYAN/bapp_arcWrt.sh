#!/bin/bash


build_all()
{
	cd openwrt
	make package/feeds/feeds_addon/lib_arc_owl/{clean,prepare,compile}
	make package/feeds/feeds_addon/libowlmap/{clean,prepare,compile}
	make package/feeds/feeds_addon/arc_muap_lib/{clean,prepare,compile}
	make package/feeds/feeds_addon/owlmap/{clean,prepare,compile}
	make package/feeds/feeds_addon/arc_muap/{clean,prepare,compile}
	make package/feeds/feeds_addon/lib_arc_owl_sys/{clean,prepare,compile}
	make package/feeds/feeds_addon/arc_owl/{clean,prepare,compile}
	cd -
}

build_package()
{
	cd openwrt
	make package/feeds/feeds_addon/${1}/{clean,prepare,compile} ${2}
	cd -
}


CMD="$1";
case "$CMD" in
	all) 	build_all 0;;
	*)		build_package "$@";;
esac
