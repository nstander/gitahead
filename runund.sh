#!/usr/bin/env bash

mkdir -p ccout
echo "Running Und"
$STIHOME/und -db gitahead.und \
  analyze -sarif und_analyze.sarif \
  codecheck -sarif und_ccrecommended.sarif "SciTools' Recommended Checks" ccout/
