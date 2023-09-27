#!/bin/bash

rg -N -e '^[a-fA-F0-9]{40}$' $1 > sha1.txt

rg -N -e '^[a-fA-F0-9]{64}$' $1 > sha256.txt

rg -N -e '^[a-fA-F0-9]{32}$' $1 > md5.txt

rg -N -e '^\$2[ayb]\$.{56}$' $1 > bcrypt.txt

rg -N -e '^[a-fA-F0-9]{128}$' $1 > sha512.txt

rg -N --invert-match -e '^[a-fA-F0-9]{40}$' $1 | rg -N --invert-match -e '^[a-fA-F0-9]{64}$' | rg -N --invert-match -e '^[a-fA-F0-9]{32}$' | rg -N --invert-match -e '^\$2[ayb]\$.{56}$' | rg -N --invert-match -e  '^[a-fA-F0-9]{128}$' > therest.txt
