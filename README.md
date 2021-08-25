# Rails 6 Finance Stock Tracker

## Stack
Ruby 2.7
Rails 6

## IEX API integration configuration

Credentials configured via Rails 6 credentials storage mechanism encrypted with master key. 
To get access to the credential using VSCode for example type in your CLI:

```bash
EDITOR="code --wait" rails credentials:edit
```
To get access keys register at [official IEX website](https://iexcloud.io/) 


Add the credentials given on registration finished to the configuration Yaml file opened by the command above this way

```yaml
iex:
  publishable_token: ""
  secret_token: ""
  endpoint: ""
```

More information about iex-ryby-client IEX integration gem in the [official repo](https://github.com/dblock/iex-ruby-client).
