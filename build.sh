#!/bin/sh

output_name='release.aseprite-extension'
output_dir='out'

rm -f "$output_dir/$output_name"
mkdir -p "$output_dir"

(cd src && zip -X -r "../$output_dir/$output_name" .)
