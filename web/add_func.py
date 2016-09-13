# -*- coding: utf-8 -*-
from transliterate import translit
from classifier.settings import *
import re

def GetSlug (RusString):
    result = re.sub(r'[/\\]+', '_', RusString)
    result = translit(result, "ru", reversed=True)
    result = re.sub(r'[-\s]+', '_', result)
    result = re.sub(r'\W+', '', result)
    result = re.sub(r'_+', '-', result)
    result = result.lower()
    # print result
    return result
