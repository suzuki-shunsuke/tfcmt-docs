---
sidebar_position: 650
---

# Output the result to a local file

[#194](https://github.com/suzuki-shunsuke/tfcmt/issues/194) [#654](https://github.com/suzuki-shunsuke/tfcmt/pull/654) `tfcmt >= v4.2.0`

:::caution
This feature hasn't been released yet, but will be released in v4.2.0.
You can try this feature using the prerelease version [v4.2.0-1](https://github.com/suzuki-shunsuke/tfcmt/releases/tag/v4.2.0-1).
:::

tfcmt normally posts the result of `terraform plan` and `terraform apply` to GitHub Pull Requests as a comment.
But tfcmt also supports outputting the result to a local file by `--output` option.

tfcmt plan:

```console
$ tfcmt --output plan.md plan -- terraform plan
```

tfcmt apply:

```console
$ tfcmt --output apply.md apply -- terraform apply
```

When a specified file doesn't exist, the file is created.
When the file already exist, the file content is overwritten.
[Metadata](embedded-metadata.md) isn't embedded.
