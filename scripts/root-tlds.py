#!/usr/bin/env nix-shell
#! nix-shell -i python3 -p python3
import os
import urllib.request
import json

url = "http://data.iana.org/TLD/tlds-alpha-by-domain.txt"
print(f"Fetching TLDs from {url}...")

response = urllib.request.urlopen(url)
content = response.read().decode("utf-8")

tlds = [line.strip().lower() for line in content.split("\n") if line.strip() and not line.startswith("#")]

# Get the script directory
script_dir = os.path.dirname(os.path.abspath(__file__))

# Save TLDs to a JSON file in the script directory
output_file = os.path.join(script_dir, "../modules/tlds.json")
with open(output_file, "w") as f:
    json.dump(tlds, f)

print(f"TLDs saved to {output_file}")
