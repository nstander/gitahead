#!/usr/bin/env bash

mkdir -p ccout
$STIHOME/und -db gitahead.und \
  analyze -errors -sarif und_analyze.sarif \
  codecheck -sarif und_ccrecommended.sarif "SciTools' Recommended Checks" ccout/
