#!/usr/bin/env python

import os
import requests

def msg(text):
  """Give message to user."""
  os.system('notify-send "Atom updater" "{}"'.format(text)
  + ' 2>/dev/null '
  +'|| echo "{}"'.format(text))


def current():
    """Get current version."""
    f = os.popen("apt show atom 2>/dev/null | grep Ver")
    result = f.read()
    if result:
      return result.split(' ')[-1]
    return "0.0"

def latest():
    """Get latest version."""
    upd_url = 'https://github.com/atom/atom/releases/latest'
    final = requests.get(upd_url).url
    return final.split('tag/v')[-1]

def compare(cv, lv):
    """Compare versions."""
    return lv.split('.') > cv.split('.')

def upgrade(version):
    """Perform upgrade."""
    tempfile = '/tmp/atom.deb'
    url = (
        'https://github.com/atom/atom/releases/download/'
        'v{}/atom-amd64.deb'.format(version)
    )
    code = os.system(
        'rm -f {} && '
        'wget "{}" -O {} && '
        'sudo dpkg -i {}'.format(tempfile, url, tempfile, tempfile)
    )
    return code == 0

if __name__ == '__main__':
    cv = current()
    try:
        lv = latest()
    except requests.exceptions.ConnectionError:
        print 'No network'
        exit(0)
    print 'Current version', cv
    print 'Latest version', lv
    result = compare(cv, lv)
    if result:
        print 'A new version is available!'
        msg('Updating Atom to version {}...'.format(lv))
        if upgrade(lv):
            msg('Update completed.')
        else:
            msg('Problem during update.')
    else:
        msg('Atom is updated.')
