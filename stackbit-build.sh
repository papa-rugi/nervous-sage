#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db29adf3a1dd2001305d9ef/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db29adf3a1dd2001305d9ef
curl -s -X POST https://api.stackbit.com/project/5db29adf3a1dd2001305d9ef/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db29adf3a1dd2001305d9ef/webhook/build/publish > /dev/null
