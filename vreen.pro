TEMPLATE  = subdirs

CONFIG   += ordered
SUBDIRS = src examples tests

examples.depends = src
tests.depends = src
