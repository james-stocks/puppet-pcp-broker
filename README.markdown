#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Limitations - OS compatibility, etc.](#limitations)
4. [Development - Guide for contributing to the module](#development)

## Overview

Automates setup of [pcp-broker](https://github.com/puppetlabs/pcp-broker) for testing purposes

## Usage

Basic usage:
```
require pcp_broker
```

This will set up and run pcp-broker on the host using default configuration and directories.

Set up pcp-broker without running it:
```
class { 'pcp_broker':
 run_broker => false,
}
```

This will set up pcp-broker but will not run it

Refer to manifests/init.pp for a full list of params.

## Limitations

 * Currently the module will run broker in a "fire and forget" manner using an Exec resource. It will not check if broker is already running before attempting to run it; and it will not check if it started correctly.
 * The module currently does not have a mechanism for stopping the broker once it has been launched.

## Development

See [CONTRIBUTING.md](https://github.com/james-stocks/puppet-pcp-broker/blob/master/CONTRIBUTING.md)
