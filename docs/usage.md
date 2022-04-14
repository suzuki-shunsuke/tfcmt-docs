---
sidebar_position: 600
---

# Command Usage

```console
$ tfcmt --version
tfcmt version 3.1.1 (6e6358b49ce95b52f3287c4376bf66a3c7bc13e8)
```

```console
$ tfcmt help
NAME:
   tfcmt - Notify the execution result of terraform command

USAGE:
   tfcmt [global options] command [command options] [arguments...]

VERSION:
   3.1.1 (6e6358b49ce95b52f3287c4376bf66a3c7bc13e8)

COMMANDS:
   plan     Run terraform plan and post a comment to GitHub commit or pull request
   apply    Run terraform apply and post a comment to GitHub commit or pull request
   version  Show version
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --owner value      GitHub Repository owner name
   --repo value       GitHub Repository name
   --sha value        commit SHA (revision)
   --build-url value  build url
   --log-level value  log level
   --pr value         pull request number (default: 0)
   --config value     config path
   --var value        template variables. The format of value is '<name>:<value>'  (accepts multiple inputs)
   --help, -h         show help (default: false)
   --version, -v      print the version (default: false)
```

### -var option

tfcmt supports passing variables by `-var` option.
The format of the value should be `<name>:<value>`.

```console
$ tfcmt -var name:foo plan -- terraform plan
```

The variables can be referred in `template` and `label`.

```yaml
terraform:
  plan:
    template: |
      {{.Vars.name}}
      ...
    when_add_or_update_only:
      label: "{{.Vars.name}}/add-or-update"
```

## tfcmt plan

```console
$ tfcmt help plan
NAME:
   tfcmt plan - Run terraform plan and post a comment to GitHub commit or pull request

USAGE:
   tfcmt plan [arguments...]
```

e.g.

```console
$ tfcmt plan -- terraform plan -no-color
```

## tfcmt apply

```console
$ tfcmt help apply
NAME:
   tfcmt apply - Run terraform apply and post a comment to GitHub commit or pull request

USAGE:
   tfcmt apply [arguments...]
```

e.g.

```console
$ tfcmt apply -- terraform apply -auto-approve -no-color
```

## :warning: Terraform's `-no-color` option is required to parse the result properly

Please set [Terraform's -no-color option](https://www.terraform.io/cli/commands/plan#no-color), otherwise tfcmt may fail to parse the result.

```console
$ tfcmt plan -- terraform plan -no-color
```

```console
$ tfcmt apply -- terraform apply -auto-approve -no-color
```
