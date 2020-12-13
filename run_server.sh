#!/bin/bash
# CakeChat server runner
# 1. run server by running this script
# 2. in new console run the next:
# 
# python tools/telegram_bot.py --token <telegram token>
# or
# python tools/test_api.py -f 127.0.0.1 -p 8080 \
#    -c "Hi, what's up?"
#    -e "joy"

source activate ai
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

python bin/cakechat_server.py
