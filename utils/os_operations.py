from robot.api.deco import keyword
import os

ROBOT_LIBRARY_VERSION = "0.0.1"

@keyword
def execute_local_command(cmd):
    return os.popen(str(cmd)).read()
