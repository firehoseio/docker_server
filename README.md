# firehose-docker

[Firehose][firehose] as a [Docker][docker] container. Configuration is passed using environment variables with `--env` or `--env-file` when running with `docker run`. Learn more about [Firehose][firehose] configuration at https://github.com/polleverywhere/firehose.

## Usage

A typical way to run this image would be to pass an environment file and publish the needed port:

`docker run --env-file $(pwd)/firehose.env -p 7474 --name firehose -d firehose/server`

Then lookup the NAT port using:

`docker port firehose 7474`

## Environment

An example `firehose.env` file might look like:

    # URI to the Redis store
    REDIS_URL=redis://redis.b3ldn2.0001.usw3.cache.amazonaws.com:6379/0

    # The Rainbows! worker count to run
    WORKER_PROCESSES=4

    # Configure the verbosity of the logger
    LOG_LEVEL=info

    # Firehose port binding
    PORT=7474

    # Firehose IP address binding
    HOST=0.0.0.0

    # Server can be rainbows or thin
    SERVER=rainbows

    # Configure a production or development environment for Rainbows! or thin
    RACK_ENV=production

## Vagrant

You can build and run this image using [Vagrant][vagrant]. With [Vagrant][vagrant] 1.6 or higher installed:

`vagrant up --provider docker`

A small [Docker][docker] Linux VM will be spun up prior to building the image when the host runs Mac OS X ([Docker][docker] does not run on Mac OS X). You can SSH to the [Docker][docker] VM by getting the ID of the VM from the `vagrant global-status` command:

    vagrant global-status
    id       name    provider   state     directory
    --------------------------------------------------------------------------------------
    af9f882  default virtualbox running   /Users/ubuntu/.vagrant.d/data/docker-host

Then connect to the [Docker][docker] VM using `vagrant ssh af9f882`.

[firehose]: http://firehose.io/
[docker]: https://www.docker.io/
[vagrant]: http://www.vagrantup.com/
