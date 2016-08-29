TEMPLATE = subdirs

SUBDIRS = api auth qml

auth.depends = api
qml.depends = auth
