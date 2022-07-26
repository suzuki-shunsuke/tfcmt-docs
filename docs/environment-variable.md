---
sidebar_position: 300
---

# Environment variable

* GITHUB_TOKEN
* [Native support of some CI platforms](#native-support-of-some-ci-platforms)
* [Custom Environment Variable Definition](#custom-environment-variable-definition)

## Native support of some CI platforms

Currently, supported CI are here:

- CircleCI
- Drone
- AWS CodeBuild
- GitHub Actions
- Google Cloud Build

On the supported CI platform, the following parameters are complemented by the built-in environment variables.

- `-owner`
- `-repo`
- `-pr`
- `-sha`
- `-build-url`

This feature is implemented by [go-ci-env](https://github.com/suzuki-shunsuke/go-ci-env).

:warning: You can also use tfcmt on other platform with CLI flags or Custom Environment Variable Definition.

## Google Cloud Build Support

tfcmt >= [v3.3.0](https://github.com/suzuki-shunsuke/tfcmt/releases/tag/v3.3.0)

[#376](https://github.com/suzuki-shunsuke/tfcmt/pull/376)

Set the environment variable `GOOGLE_CLOUD_BUILD`.

```sh
GOOGLE_CLOUD_BUILD=true
```

Set the following environment variables using [substitutions](https://cloud.google.com/cloud-build/docs/configuring-builds/substitute-variable-values).

* `COMMIT_SHA`
* `BUILD_ID`
* `PROJECT_ID`
* `_PR_NUMBER`
* `_REGION`

Specify the repository owner and name in `tfcmt.yaml`.

e.g.

tfcmt.yaml

```yaml
repo_owner: suzuki-shunsuke
repo_name: tfcmt
```

## Custom Environment Variable Definition

You can complement the above parameters on the other platform like Travis CI and Jenkins with Custom Environment Variable Definition.

tfcmt.yaml

```yaml
ci:
  pr:
  - type: envsubst
    value: "${PR_NUMBER}"
  sha:
  - type: envsubst
    value: "${SHA}"
  link:
  - type: envsubst
    value: "${LINK}"
  owner:
  - type: envsubst
    value: "${REPO_OWNER}"
  repo:
  - type: envsubst
    value: "${REPO_NAME}"
  vars:
    yoo: # the variable "yoo" is added to ".Vars"
    - type: template
      value: '{{env "YOO"}}'
```

The following types are supported.

* `envsubst`: [drone/envsubst#EvalEnv](https://pkg.go.dev/github.com/drone/envsubst#EvalEnv)
* `template`: Go's [text/template](https://golang.org/pkg/text/template/) with [sprig functions](http://masterminds.github.io/sprig/)
