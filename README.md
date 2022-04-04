# Node Dockerfile with Python 2.7
Thus far, contains Dockerfile and .dockerignore.

  1. After tailoring the Dockerfile -- `docker build -t nodeapp_py27 .`
  2. Then run container based on image:
     ```
     docker run nodeapp_py27 (current window, non-interactive)
     docker run -d nodeapp_py27 (detached, non-interactive)
     docker run -it nodeapp_py27 (interactive)
     ```
