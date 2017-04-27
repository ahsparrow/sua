#!/bin/bash

# DOS -> UNIX
sed 's///' |\

# Remove LoA airspace
sed '/^#FILTERTAG LOAI/,/^#FILTERTAG/ {/^#FILTERTAG/! d}' |\

# Remove wave boundaries
sed '/^#FILTERTAG WAVEB/,/^#FILTERTAG/ {/^#FILTERTAG/! d}' |\

# Remove obstacles
sed '/^#FILTERTAG RTMS/,/^#FILTERTAG RTME/ {/^#FILTERTAG RTM/! d}' |\

# De-duplicate HIRTA SPADEADAM
sed '0,/^TITLE=HIRTA SPADEADAM/ s//TITLE=HIRTA SPADEADAM-1/' |\
sed 's/^TITLE=HIRTA SPADEADAM$/TITLE=HIRTA SPADEADAM-2/' |\

# Set class/type for gliding clubs
sed '/^#FILTERTAG GCATZS/aCLASS=X' |\
sed '/^#FILTERTAG GCATZS/aTYPE=GSEC'
