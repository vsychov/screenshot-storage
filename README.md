# What is it?
This is screenshot upload tool for macos and more platforms.

- `terraform_s3/module` contains module to deploy s3 bucket
- `worker` contains cloudlfare worker
- `client/macos` contains example client for MacOS

You need cloudflare (used only for hide aws bucket name) and aws account

1. create bucket by terraform
2. upload worker to cloudflare
3. copy `wrangler.toml.example` -> `wrangler.toml`, edit variables and worker name
4. run `wrangler publish` inside docker
5. setup client

