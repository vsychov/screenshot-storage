# What is it?
This is screenshot upload tool for macos and more platforms.

- `terraform_s3/module` contains module to deploy s3 bucket
- `worker` contains cloudlfare worker
- `client/macos` contains example client for MacOS

You need cloudflare (used only for hide aws bucket name) and aws account

1. create bucket by terraform
2. upload worker to cloudflare, fix bucket name, run `wrangler publish` inside docker
3. setup client

