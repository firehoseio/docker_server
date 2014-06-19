# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "redis" do |redis|
    redis.vm.provider "docker" do |d|
      d.name = "redis"
      d.image = "redis"
    end
  end

  config.vm.define "firehose" do |firehose|
    firehose.vm.provider "docker" do |d|
      d.name = "firehose"
      d.image = "firehose/server"
      d.ports = ["7474:7474"]
      d.link "redis:redis"
      d.env = {
        "LOG_LEVEL" => "info",
        "PORT" => "7474",
        "HOST" => "0.0.0.0",
        "SERVER" => "rainbows"
      }
    end
  end
end
