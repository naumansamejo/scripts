#!/bin/bash

# GitHub repository and file paths
REPO="https://github.com/Studio-Almond/sa-core.git"
account=(
	"templates" 
	"sections/cart-drawer.liquid"
)

PATHS=$account



# Use a case statement to execute commands based on the first argument
case "$1" in
	"account")
		PATHS=$account

		;;
	"cart")
			
		;;

	*)
		echo "Invalid argument."
		exit 1
		;;
esac

# Clone the repository
git clone "$REPO" ./_temp_clone


# Loop through the file paths and download each file
for path in "${PATHS[@]}"; do
	rsync -aR "./_temp_clone/./$path" ./
done

rm -rf "./_temp_clone"