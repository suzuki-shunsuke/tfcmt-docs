---
sidebar_position: 700
---

# GitHub Enterprise Support

:warning: I ([@suzuki-shunsuke](http://github.com/suzuki-shunsuke)) don't use GitHub Enterprise, so I can't confirm if tfcmt works well for GitHub Enterprise.

To use tfcmt for GitHub Enterprise, please set the following fields in `tfcmt.yaml`.

e.g. tfcmt.yaml

```yaml
ghe_base_url: https://example.com
ghe_graphql_endpoint: https://example.com/api/graphql
```

* https://docs.github.com/en/enterprise-server@3.5/rest/overview/resources-in-the-rest-api#current-version
* https://docs.github.com/en/enterprise-server@2.20/graphql/guides/forming-calls-with-graphql#the-graphql-endpoint
