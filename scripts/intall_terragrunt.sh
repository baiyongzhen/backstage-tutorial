#!/bin/bash

set -e


curl -L curl -sfL https://direnv.net/install.sh | bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash && tfswitch 0.14.7
curl -L https://raw.githubusercontent.com/warrensbox/tgswitch/release/install.sh | sudo bash && tgswitch 0.28.7