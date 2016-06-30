# -*- coding: utf-8 -*-
from transliterate import translit
from classifier.settings import *
import re

def GetSlug (RusString):
    return translit(RusString, "ru", reversed=True).lower().replace(u" ", u"-").replace(u"'", u"’").replace(u"\"", u"’").replace(u"/", u"~").replace(u"\\", u"~")
