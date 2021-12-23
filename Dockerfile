FROM nginx/unit:1.26.1-python3.9
COPY requirements.txt /config/requirements.txt
# PIP isn't installed by default, so we install it first.
# Next, we install the requirements, remove PIP, and perform image cleanup.
RUN apt update && apt install -y python3-pip                                  \
    && pip3 install -r /config/requirements.txt                               \
    && apt remove -y python3-pip                                              \
    && apt autoremove --purge -y                                              \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*.list
