---
sidebar_position: 600
---

# Command Usage

```console
$ tfcmt --version
tfcmt version 4.4.3 (4a492ac82c59c1a60b114d4038fb5fc83bff0502)
```

```console
$ tfcmt --help
NAME:
   tfcmt - Notify the execution result of terraform command

USAGE:
   tfcmt [global options] command [command options] [arguments...]

VERSION:
   4.4.3 (4a492ac82c59c1a60b114d4038fb5fc83bff0502)

COMMANDS:
   plan     Run terraform plan and post a comment to GitHub commit or pull request
   apply    Run terraform apply and post a comment to GitHub commit or pull request
   version  Show version
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --owner value                GitHub Repository owner name [$TFCMT_REPO_OWNER]
   --repo value                 GitHub Repository name [$TFCMT_REPO_NAME]
   --sha value                  commit SHA (revision) [$TFCMT_SHA]
   --build-url value            build url
   --log-level value            log level
   --pr value                   pull request number (default: 0) [$TFCMT_PR_NUMBER]
   --config value               config path [$TFCMT_CONFIG]
   --var value [ --var value ]  template variables. The format of value is '<name>:<value>'
   --output value               specify file to output result instead of post comment
   --help, -h                   show help
   --version, -v                print the version
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
   tfcmt plan [command options] [arguments...]

OPTIONS:
   --patch            update an existing comment instead of creating a new comment. If there is no existing comment, a new comment is created. (default: false)
   --skip-no-changes  If there is no change tfcmt updates a label but doesn't post a comment (default: false)
   --help, -h         show help
```

e.g.

```console
$ tfcmt plan -- terraform plan
```

## tfcmt apply

```console
$ tfcmt help apply
NAME:
   tfcmt apply - Run terraform apply and post a comment to GitHub commit or pull request

USAGE:
   tfcmt apply [command options] [arguments...]

OPTIONS:
   --help, -h  show help
```

e.g.

```console
$ tfcmt apply -- terraform apply
```
