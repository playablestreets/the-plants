import os
import time

def watch_for_shutdown_file():
    directory = os.path.dirname(os.path.realpath(__file__))
    shutdown_file = os.path.join(directory, "shutdown.tmp")

    while True:
        if os.path.exists(shutdown_file):
            os.remove(shutdown_file)
            print("SHUTDOWN!")
            os.system("systemctl poweroff")
            break
        time.sleep(5)

if __name__ == "__main__":
    watch_for_shutdown_file()