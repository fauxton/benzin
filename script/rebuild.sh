#!/bin/bash

rm benzin-0.0.1.gem
gem uninstall benzin
gem build benzin.gemspec
gem install benzin-0.0.1.gem
