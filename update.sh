#!/bin/bash
# Precompile assets


export RAILS_ENV=production

rails assets:precompile

# Run database migrations and seed
rails db:migrate

# Update judge client
cd "../tioj-judge"
git pull  # Assuming the judge client is in a git repository
mkdir -p build
cd build
cmake -G Ninja ..
ninja -j $(($(nproc)-2))
sudo ninja install

# Restart services
sudo systemctl restart tioj-judge  # Assuming tioj-judge is running as a systemd service
sudo systemctl restart nginx
