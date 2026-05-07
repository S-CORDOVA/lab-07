# VetClinic Lab 7

## Setup and run

```bash
bundle install
bin/rails db:setup
bin/rails server

Open the app at:

http://localhost:3000


This app uses Active Storage image variants for pet thumbnails.

libvips is required.

On Ubuntu or WSL:

sudo apt update
sudo apt install libvips
Sanitization check

I tested Action Text by adding this to a treatment's clinical notes:

<script>alert(1)</script>

No alert appeared on the appointment show page, so the script did not run.