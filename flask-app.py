#!/usr/bin/env python3

from ddtrace import patch_all
patch_all()

from flask import Flask

import os


print()
for envvar_name in ['DD_ENV', 'DD_SERVICE', 'DD_VERSION',
                    'DD_AGENT_HOST', 'DD_TRACE_AGENT_PORT']:
    print('%22s: %s' % (envvar_name, os.environ.get(envvar_name)))
print()

app = Flask(__name__)

@app.route('/')
def index():
    return 'hello world'

@app.route('/health')
def health():
    return 'OK'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
