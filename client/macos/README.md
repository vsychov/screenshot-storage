## Requirements:
- [Flameshot](https://github.com/flameshot-org/flameshot/)
- S3 bucket
- aws-cli
- openssl
- terminal-notifier

- ## Setup:
- install terminal-notifier by `brew install terminal-notifier`
- install flameshot by `brew install flameshot`
- Copy `flameshot-s3.sh`
- Modify url and bucket name within script
- Run `aws configure --profile flameshot-upload` use terraform module to configure bucket
- You may need to `chmod +x flameshot-s3.sh`
- Add to /usr/local/bin `sudo cp flameshot-s3.sh /usr/local/bin/flameshots3`
- Optionally assign `flameshots3` to keyboard shortcut

Based on https://github.com/notmeta/flameshot-s3-uploader
