---
sidebar_position: 600
---

# Patch `tfcmt plan` comment

tfcmt >= [v3.2.0](https://github.com/suzuki-shunsuke/tfcmt/releases/tag/v3.2.0)

[#199](https://github.com/suzuki-shunsuke/tfcmt/issues/199) [#245](https://github.com/suzuki-shunsuke/tfcmt/issues/245) [#248](https://github.com/suzuki-shunsuke/tfcmt/issues/248) [#249](https://github.com/suzuki-shunsuke/tfcmt/issues/249)

The option `-patch` has been added to `tfcmt plan` command.

```console
tfcmt plan -patch -- terraform plan -no-color
```

And the configuration option `plan_patch` has been added.

```yaml
plan_patch: true
```

The command line option `-patch` takes precedence over configuration file option `plan_patch`.

If you want to disable patching although `plan_patch` is true, please set `-patch=false`.

```console
$ tfcmt plan -patch=false -- terraform plan -no-color
```

### Motivation

By patching the comment instead of creating a new comment, you can keep the pull request comments clean.

### Trouble shooting

If the comment isn't patched expectedly, please set `-log-level=debug`.

```console
$ tfcmt -log-level=debug plan -patch -- terraform plan -no-color
```
