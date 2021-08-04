# Export current (local) DB
wp db export db.sql

# Copy file from local to server (may need to amend server path if not in html folder)
# The example below is for local to remote, simply swap these 2 around for remote to local
scp -r db.sql www-data@IP_ADDRESS:/var/www/html

# SSH onto box (should be same connection details as above)
ssh www-data@IP_ADDRESS

# Run the WP CLI DB importer
wp db import db.sql

# Use --dry-run first to check that changes will be OK in DB
wp search-replace old-site-url.co.uk new-site-url.co.uk --dry-run
wp search-replace old-site-url.co.uk new-site-url.co.uk

# Delete imported DB file
rm db.sql
