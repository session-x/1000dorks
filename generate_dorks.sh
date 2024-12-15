#!/bin/bash

# Function to generate Google Dork URLs
generate_dorks() {
    domain=$1
    output_file=$2

    # List of dorks
    dorks=(
    "site:$domain intitle:index.of \"secrets\""
    "site:$domain intitle:index.of \"config\""
    "site:$domain ext:ini \"password\""
    "site:$domain ext:txt \"API_KEY\""
    "site:$domain ext:json \"auth_token\""
    "site:$domain ext:env \"AWS_ACCESS_KEY\""
    "site:$domain inurl:\"../\""
    "site:$domain inurl:\"..%2F\""
    "site:$domain inurl:\"..%5C\""
    "site:$domain intitle:index.of \"backup\""
    "site:$domain ext:sql \"select * from\""
    "site:$domain wp-config.php"
    "site:$domain wp-login.php"
    "site:$domain inurl:/git"
    "site:$domain inurl:/admin/portal"
    "site:$domain intitle:index.of \"database\""
    "site:$domain \"default credentials\""
    "site:$domain \"admin login\""
    "site:$domain \"forgot password\""
    "site:$domain ext:log \"username\" \"password\""
    "site:$domain intitle:\"admin login\""
    "site:$domain inurl:adminpanel"
    "site:$domain intitle:\"control panel\""
    "site:$domain inurl:/admin/portal"
    "site:$domain ext:bak"
    "site:$domain ext:tar"
    "site:$domain ext:gz"
    "site:$domain ext:zip"
    "site:$domain ext:rar"
    "site:$domain inurl:\"/.git/config\""
    "site:$domain intitle:index.of \".git\""
    "site:$domain inurl:/repo/.git"
    "site:$domain inurl:/src/.git"
    "site:$domain ext:ini \"DB_PASSWORD\""
    "site:$domain ext:env \"DB_USERNAME\""
    "site:$domain intitle:index.of \"config.json\""
    "site:$domain intitle:index.of \"server.conf\""
    "site:$domain ext:json \"database\""
    "site:$domain inurl:\".env\""
    "site:$domain \"backup\" \"database\""
    "site:$domain intitle:index.of \"nginx.conf\""
    "site:$domain intitle:index.of \"web.config\""
    "site:$domain intitle:index.of \"application.yml\""
    "site:$domain intitle:index.of \"httpd.conf\""
    "site:$domain \"AWS_SECRET_ACCESS_KEY\""
    "site:$domain intitle:index.of \"passwd\""
    "site:$domain \"DB_PASSWORD\""
    "site:$domain inurl:/admin/login"
    "site:$domain inurl:/login"
    "site:$domain intitle:\"control panel\""
    "site:$domain intitle:\"admin area\""
    "site:$domain inurl:admin.php"
    "site:$domain inurl:administrator.php"
    "site:$domain inurl:adminLogin"
    "site:$domain intitle:\"admin dashboard\""
    "site:$domain inurl:\"adminaccess\""
    "site:$domain intitle:index.of \"passwords\""
    "site:$domain intitle:index.of \"backups\""
    "site:$domain intitle:index.of \"userlist\""
    "site:$domain inurl:\"/admin/portal\""
    "site:$domain ext:php \"password\""
    "site:$domain ext:php \"username\""
    "site:$domain intitle:index.of \"secrets.txt\""
    "site:$domain \"api key\" \"auth\""
    "site:$domain intitle:index.of \"credentials.txt\""
    "site:$domain intitle:index.of \"private_key\""
    "site:$domain ext:csv \"password\""
    "site:$domain intitle:index.of \"keys.txt\""
    "site:$domain ext:json \"secret_key\""
    "site:$domain intitle:index.of \"db_credentials\""
    "site:$domain inurl:\"/admin/secure/\""
    "site:$domain inurl:\"user_credentials\""
    "site:$domain \"database dump\""
    "site:$domain inurl:\"/configurations/\""
    "site:$domain intitle:index.of \"config.xml\""
    "site:$domain intitle:index.of \"admin-config\""
    "site:$domain inurl:/admin/backup/"
    "site:$domain inurl:\"private-key.pem\""
    "site:$domain inurl:config.php"
    "site:$domain \"database\" \"dump\""
    "site:$domain intitle:index.of \"api_keys\""
    "site:$domain inurl:\"server/config\""
    "site:$domain \"DB_PASSWORD\" \"default\""
    "site:$domain intitle:index.of \"api_secret_key\""
    "site:$domain \"api-key.txt\""
    "site:$domain ext:xml \"secret\""
    "site:$domain intitle:index.of \"pki\""
    "site:$domain intitle:index.of \"tokens\""
    "site:$domain inurl:\"/admin/settings\""
    "site:$domain \"AWS\" \"key\""
    "site:$domain ext:php \"secret_key\""
    "site:$domain \"Git\" \"repository\""
    "site:$domain intitle:index.of \"backup_files\""
    "site:$domain ext:txt \"AWS_SECRET_KEY\""
    "site:$domain inurl:\".gitignore\""
    "site:$domain \"server access\" \"credentials\""
    "site:$domain \"database configuration\" \"password\""
    "site:$domain inurl:\"/admin/config/\""
    "site:$domain inurl:\"/private/backup\""
    "site:$domain ext:log \"api_key\""
    )

    # Loop through the list of dorks and generate the URLs
    for dork in "${dorks[@]}"; do
        # URL encode the dork string
        encoded_dork=$(echo "$dork" | jq -sRr @uri)
        # Generate the Google search URL
        search_url="https://www.google.com/search?q=$encoded_dork"
        # Save the URL to the output file
        echo "$search_url" >> "$output_file"
    done
}

# Get domain from user
read -p "Enter the domain name (e.g., example.com): " domain

# Validate if the domain is not empty
if [ -z "$domain" ]; then
    echo "Domain name is required!"
    exit 1
fi

# Output file to save the search URLs
output_file="${domain}_google_dorks.txt"

# Generate the Google Dorks and save them to the output file
generate_dorks "$domain" "$output_file"

# Notify the user
echo "Google Dorks for $domain have been saved to $output_file."
