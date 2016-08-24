# xonsh-scrapy-tabcomplete
Tab completion for scrapy in xonsh 

<hr>
[![PyPi version](https://img.shields.io/pypi/v/xonsh-scrapy-tabcomplete.svg?style=flat-square)](https://pypi.python.org/pypi/xonsh-scrapy-tabcomplete)
[![PyPi license](https://img.shields.io/pypi/l/xonsh-scrapy-tabcomplete.svg?style=flat-square)](https://pypi.python.org/pypi/xonsh-scrapy-tabcomplete)
[![PyPi license](https://img.shields.io/pypi/pyversions/xonsh-scrapy-tabcomplete.svg?style=flat-square)](https://pypi.python.org/pypi/xonsh-scrapy-tabcomplete)  
Provides tab completion for [scrapy](https://github.com/scrapy/scrapy) for `xonsh` console shell users.
It provides auto-completion for commands and projects spiders.
Project's spider names are also cached in `$SCRAPY_CACHE` for every project directory for faster completion
in `scrapy crawl` and `scrapy check` commands.

If new spiders are added the cache is outdated and can be refreshed with `scrapy_clear_cache` alias which is created by the contrib. It clears the cache for current working directory.

## Installation
Just do a 
```console
pip install xonsh-scrapy-tabcomplete
```
or you can clone the repo via pip for the latest version
```console
pip install git+<this repo url>
```

## Configuration
To automatically load scrapy completion at startup, put
```console
xontrib load scrapy_tabcomplete
```

in your `.xonshrc`
