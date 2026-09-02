
# Modernized from the upstream repo's Dockerfile, which pins python:3.9.13.
# Python 3.9 is end-of-life and can no longer install current `requests`
# (2.34+ uses PEP 604 `str | bytes` syntax, which needs 3.10+).
#
# 3.12 matches what the bot was verified working on locally.
 
FROM python:3.12-slim
 
WORKDIR /usr/src/gamedaybot
 
COPY . .
 
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt
 
# Run as a module from the repo root so `gamedaybot.*` imports resolve without
# needing the deprecated `setup.py install` step.
CMD ["python3", "-m", "gamedaybot.espn.espn_bot"]
