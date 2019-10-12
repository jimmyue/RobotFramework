import os

from MyLibrary.jimmyeml import jimmyeml

__version_file_path__ = os.path.join(os.path.dirname(__file__), 'VERSION')
__version__ = open(__version_file_path__, 'r').read().strip()

class MyLibrary(jimmyeml):
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'
