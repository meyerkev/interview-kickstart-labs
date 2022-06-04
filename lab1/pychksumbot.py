#!/usr/bin/python3
#

import hashlib
import urllib.request


# variables
server = "http://msg2.kandek.com"


def get_hash(u):
  try:
    page = urllib.request.urlopen(u)
    s = page.read()
    return hashlib.sha224(s).hexdigest()
  except:
    return "Error in URL retrieval"

def put_hash(u,h):
  try:
    url = server + "/" + u + "?" + h
    print(url)
    page = urllib.request.urlopen(url)
    return h
  except:
    return "Error in URL retrieval"

# main
urls = ['https://en.wikipedia.org',
        'https://el.wikipedia.org',
        'https://de.wikipedia.org']
for url in urls:
    urlhash = get_hash(url)
    put_hash(url,urlhash)
