# xonsh-scrapy-tabcomplete
Tab completion for scrapy in xonsh

<hr>

This provides tab completion for [scrapy](https://github.com/scrapy/scrapy) for `xonsh` konsole shell users.
It provides auto-completion for commands and projects spiders.
Project's spider names are also cached in `$SCRAPY_CACHE` for every project directory for faster completion
in `scrapy crawl` and `scrapy check` commands.

If new spiders are added the cache is outdated and can be refreshed with `scrapy_clear_cache()`,
which clears the cache for current working directory.
`scrapy_clear_cache` is stored in `aliases`.

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
