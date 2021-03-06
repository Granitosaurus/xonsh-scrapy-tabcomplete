# coding=utf-8
from setuptools import setup

setup(
    name="xonsh-scrapy-tabcomplete",
    version="0.3",
    license="GPLv3",
    url="https://github.com/Granitas/xonsh-scrapy-tabcomplete",
    description="scrapy tabcomplete support for the Xonsh shell",
    author="Bernardas Ališauskas",
    author_email="bernardas.alisauskas@gmail.com",
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    zip_safe=False,
    classifiers=[
        "Development Status :: 4 - Beta",
        "Environment :: Console",
        "Environment :: Plugins",
        "Intended Audience :: End Users/Desktop",
        "Operating System :: POSIX",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.5",
        "License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
    ]
)
