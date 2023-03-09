#!/bin/bash
#DESCRIPTION:
#	$1 is older commit .....


generate_DAMN_patch()
{
	echo "Start to do patch"
#	echo $1
#	echo $2

	git log $1..$2 --author ron --format="%H" >> commit.txt

	i=$(git log $1..$2 --author ron --format="%H" | wc -l)
	echo "The sum of the numbers in the file is:$i"


	while IFS= read -r line
	do
		echo "$i : $line"
#		sum=$(( $sum + $line ))

		git format-patch -1 $line -o RRRRR_patchhhhhh/
		rename 0001- "$i"- RRRRR_patchhhhhh/*.patch
		i=$(($i-1))
	done < commit.txt


#	final to clean data
	rm commit.txt
}

CMD="$1";
case "$CMD" in
	*)		generate_DAMN_patch "$@";;
esac
