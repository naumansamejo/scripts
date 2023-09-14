#!/bin/bash

# GitHub repository and file paths
REPO="https://github.com/Studio-Almond/sa-core.git"

account=(
	"src/scss/account"
	
	"templates/customers" 

	"assets/sa-account.js"

	"snippets/account-settings.liquid"
	"snippets/account-address-form.liquid"
	"snippets/account-form--login.liquid"
	"snippets/account-form--recover.liquid"
	"snippets/account-form--register.liquid"
	"snippets/account-orders-table.liquid"
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
	rsync -avR "./_temp_clone/./$path" ./
done

rm -rf "./_temp_clone"