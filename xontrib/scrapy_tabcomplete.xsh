$SCRAPY_CACHE = {}

import re
_ALL_COMMANDS = re.findall('  (\w+)  ', $(scrapy --help))
_ALL_COMMANDS = [c for c in _ALL_COMMANDS if c not in ['commands', 'version']]
del re

def _scrapy_get_spiders():
    """
    Runs `scrapy list` to retrieve all spiders in current working directory
    also caches the results in $SCRAPY_CACHE
    """
    import os
    cwd = os.getcwd()
    results = $SCRAPY_CACHE.get(cwd)
    if not results:
        results = $(scrapy list 2> /dev/null).splitlines()
    if 'no active project' in ''.join(results):
        return set()
    $SCRAPY_CACHE[cwd] = results
    return set(results)

def _scrapy_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes scrapy package commands, also caches `scrapy list` in $SCRAPY_CACHE
    for faster `list` and `check` completion.
    """
    if not line.startswith('scrapy'):
        return
    to_spiders = ['scrapy crawl ', 'scrapy check ']
    if any(case in line for case in to_spiders):
        results = _scrapy_get_spiders()
        results = set([s for s in results
                       if prefix in s.lower()])
        return results
    if len(line.split()) > 1 and line.endswith(' ') or len(line.split()) > 2:
        # "scrapy new " -> no complete (note the space)
        return

    if prefix in _ALL_COMMANDS:
        # "scrapy crawl" -> suggest replacing crawl with other command
        return _ALL_COMMANDS, len(prefix)
    elif prefix:
        # "scrapy cra" -> suggest "crawl"
        return [c for c in _ALL_COMMANDS if c.startswith(prefix)], len(prefix)
    return set(_ALL_COMMANDS)

def _scrapy_clear_cache(args, stdin=None):
    import os
    try:
        key = os.getcwd()
        del $SCRAPY_CACHE[key]
    except KeyError:
        pass

aliases['scrapy_clear_cache'] = _scrapy_clear_cache
#add to list of completers
__xonsh_completers__['scrapy'] = _scrapy_completer
#bump to top of list (otherwise bash completion interferes)
__xonsh_completers__.move_to_end('scrapy', last=False)
