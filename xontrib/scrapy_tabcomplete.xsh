import os
import re
$SCRAPY_CACHE = {}

def scrapy_get_spiders():
    """
    Runs `scrapy list` to retrieve all spiders in current working directory
    also caches the results in $SCRAPY_CACHE
    """
    cwd = os.getcwd()
    results = $SCRAPY_CACHE.get(cwd)
    if not results:
        results = $(scrapy list 2> /dev/null).splitlines()
    if 'no active project' in ''.join(results):
        return set()
    $SCRAPY_CACHE[cwd] = results
    return set(results)

def scrapy_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes scrapy package commands, also caches `scrapy list` in $SCRAPY_CACHE
    for faster `list` and `check` completion.
    """
    to_spiders = ['scrapy crawl', 'scrapy check']
    if any(case in line for case in to_spiders):
        results = scrapy_get_spiders()
        results = set([s for s in results
                   if prefix in s.lower()])
        return results
    if line.startswith('scrapy'):
        all_commands = re.findall('  (\w+)  ', $(scrapy --help))
        blacklist = ['commands', 'version']
        return set(c for c in all_commands if c not in blacklist)

def scrapy_clear_cache():
    try:
        del $SCRAPY_CACHE[os.getcwd()]
    except KeyError:
        pass

aliases['scrapy_clear_cache'] = scrapy_clear_cache
completer add 'scrapy' scrapy_completer "start"
