#!/bin/bash
url="https://media.notmeta.io"
bucket_name="media.notmeta.io"

temp_file="/tmp/screenshot.png"

rand_file_name=$(openssl rand -hex 6)
prefix=$(date +'%Y/%m/%d')
full_object_name="$prefix/$rand_file_name.png"

# Run flameshot --help for options
/Applications/flameshot.app/Contents/MacOS/flameshot gui -r > $temp_file

if [[ $(file --mime-type -b $temp_file) != "image/png" ]]; then
  rm $temp_file
  /usr/local/bin/terminal-notifier -title "Flameshot S3" -message "Screenshot aborted" && exit 0
fi

/usr/local/bin/aws s3 cp "$temp_file" "s3://$bucket_name/$full_object_name" --acl public-read --profile flameshot-upload
image_url="$url/$full_object_name"

echo -n $image_url | pbcopy
/usr/local/bin/terminal-notifier -title "Flameshot S3" -message "Image URL copied to clipboard" -appIcon $temp_file
rm $temp_file
