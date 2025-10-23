#!/usr/bin/env bash

if command -v direnv >/dev/null 2>&1; then
    direnv exec . clangd "$@"
else
    clangd "$@"
fi

