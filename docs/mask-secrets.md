---
sidebar_position: 560
---

# Mask secrets

[#1083](https://github.com/suzuki-shunsuke/tfcmt/discussions/1083) [#1115](https://github.com/suzuki-shunsuke/tfcmt/pull/1115) `tfcmt >= v4.9.0`

You can mask secrets in outputs of terraform.
This feature prevents the leak of secrets.

The following outputs are masked.

- Standard output of terraform command
- Standard error output of terraform command
- Pull request comment of `tfcmt plan` and `tfcmt apply`
- [local files created by `--output` option](output-file.md)

You can use environment variables `TFCMT_MASKS` and `TFCMT_MASKS_SEPARATOR`.

- `TFCMT_MASKS`: A list of masks. Masks are joined by `TFCMT_MASKS_SEPARATOR`
- `TFCMT_MASKS_SEPARATOR`: A separator of masks. The default value is `;`

The format of each mask is `${type}:${value}`.
`${type}` must be either `env` or `regexp`.
If `${type}` is `env`, `${value}` is a masked environment variable name.
If `${type}` is `regexp`, `${value}` is a masked regular expression.

e.g. Mask GitHub access tokens and the environment variable `DATADOG_API_KEY`.

```sh
export TFCMT_MASKS="env:GITHUB_TOKEN;env:DATADOG_API_KEY;regexp:ghp_[^ ]+"
tfcmt plan -- terraform plan
```

e.g. Change the separator to `/`.

```sh
export TFCMT_MASKS_SEPARATOR=/
export TFCMT_MASKS="env:GITHUB_TOKEN/env:DATADOG_API_KEY/regexp:ghp_[^ ]+"
```
