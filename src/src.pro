TEMPLATE = subdirs

SUBDIRS = api auth

auth.depends = api
