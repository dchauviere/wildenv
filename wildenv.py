import glob
import os
import venv
import sys
from urllib.parse import urlparse
from urllib.request import urlretrieve
import subprocess
from threading import Thread

class ExtendedEnvBuilder(venv.EnvBuilder):

  def post_setup(self, context):
    """
    Set up any packages which need to be pre-installed into the
    virtual environment being created.

    :param context: The information for the virtual environment
                    creation request being processed.
    """
    if os.path.exists(os.path.join(os.getcwd(), 'requirements.txt')):
      os.environ['VIRTUAL_ENV'] = context.env_dir
      subprocess.run([context.env_exe, "-m", "pip", "install","-r", "requirements.txt"])

def detect_python(path):
  for pattern in ["**/*.py"]:
    if glob.glob(os.path.join(path, pattern), recursive=True):
      return True
  return False

if detect_python(os.getcwd()):
  builder = ExtendedEnvBuilder(with_pip=True)
  builder.create(os.path.join(os.getcwd(),'.venv'))