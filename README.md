# ci-resource-type-cron

# Crontab Resource

Implements a resource that reports new versions when the current time
matches the crontab expression

---
## Update your pipeline

Update your pipeline to include this new declaration of resource types. See the example pipeline yml snippet below or the Concourse docs for more details [here](https://concourse-ci.org/resource-types.html).
```
---
resource_types:
- name: ci-resource-type-cron
  type: registry-image
  icon: docker
  source:
    aws_access_key_id: {{PLACEHOLDER}}
    aws_secret_access_key: {{PLACEHOLDER}}
    aws_region: eu-west-2
    repository: ci-resource-type-cron
    tag: latest

resources:
  - name: weekly-trigger
    type: ci-resource-type-cron
    source:
      expression: "0 22 * * 4"
      location: "Europe/London"
```

## Source Configuration

* `expression`: *Required.* The crontab expression:

    |field       | allowed values |
    |-------------|----------------|
    |minute       | 0-59 |
    |hour         | 0-23 |
    |day of month | 1-31 |
    |month        | 1-12 (or names, see below) |
    |day of week  | 0-7 (0 or 7 is Sun, or use names) |

  e.g.

    `0 23 * * 1-5` # Run at 11:00pm from Monday to Friday

* `location`: *Optional.* Defaults to UTC. Accepts any timezone that
  can be parsed by https://godoc.org/time#LoadLocation

  e.g.

  `Europe/London`

* `fire_immediately`: *Optional.* Defaults to false. Immediately triggers the resource the first time it is checked.
