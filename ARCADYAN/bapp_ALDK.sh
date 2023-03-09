#!/bin/bash


build_all()
{
	make package/arcadyan-utility/lib_arc_owl/{clean,prepare,compile,install}
	make package/arcadyan-utility/libowlmap/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc_muap_lib/{clean,prepare,compile,install}
	make package/arcadyan-utility/owlmap/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc_muap/{clean,prepare,compile,install}
	make package/arcadyan-utility/lib_arc_owl_sys/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc_owl/{clean,prepare,compile,install}
}

build_package()
{
	make package/arcadyan-utility/${1}/{clean,prepare,compile,install} ${2}
}


build_container()
{
	echo "build $2";
	make package/arcadyan-utility/arc-container-easy-mesh/${2}/{clean,prepare,compile,install} ${3}
}

build_container_all()
{
	echo "build all";
	make package/arcadyan-utility/arc-container-easy-mesh/cntr_lib_arc_owl/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/cntr_libowlmap/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/arc_muap_lib_container/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/cntr_owlmap/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/arc_muap_container/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/cntr_lib_arc_owl_sys/{clean,prepare,compile,install}
	make package/arcadyan-utility/arc-container-easy-mesh/cntr_arc_owl/{clean,prepare,compile,install}
}

build_container_host()
{
	echo "build container and host";
	build_all
	build_container_all
}


CMD="$1";
case "$CMD" in
	all) 	build_all 0;;
	c)		build_container "$@";;
	c_all)	build_container_all 0;;
	c+h)	build_container_host 0;;
	*)		build_package "$@";;
esac
