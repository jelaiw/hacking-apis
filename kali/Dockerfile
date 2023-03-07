FROM kalilinux/kali-rolling:latest

# Perform Kali Linux configuration per author instructions in Chapter 4.
RUN apt update && apt full-upgrade -y
RUN apt install -y git python3 golang

# Install nmap.
# Install netdiscover.
# Install hashcat.
RUN apt install -y nmap netdiscover hashcat

# Install supplemental tools from Chapter 4.
RUN apt install -y nikto amass wfuzz zaproxy

# Need make to build KiteRunner.
RUN apt install -y make && \
    cd /opt && \
    git clone https://github.com/assetnote/kiterunner.git && \
    cd kiterunner && \
    make build && \
    ln -s $(pwd)/dist/kr /usr/local/bin/kr

# Install wordlists and a few web fuzzers.
RUN apt install -y wordlists dirb dirbuster gobuster

# Need pip package to install Arjun. 
# See https://github.com/s0md3v/Arjun#installing-arjun.
RUN apt install -y python3-pip && \
    cd /opt && \
    git clone https://github.com/s0md3v/Arjun.git && \
    cd Arjun/ && \
    python3 setup.py install

# Install JSON Web Token Toolkit.
# See https://github.com/ticarpi/jwt_tool.
# See https://stackoverflow.com/a/25423366 regarding source shell builtin.
SHELL ["/bin/bash", "-c"]
RUN apt install -y python3-venv && \
    cd /opt && \
    git clone https://github.com/ticarpi/jwt_tool && \
    cp jwt_tool/jwt_tool.py /usr/local/bin && \
    chmod 755 /usr/local/bin/jwt_tool.py && \
    python3 -m venv /opt/jwt_tool-venv && \
    source /opt/jwt_tool-venv/bin/activate && \
    pip install requests pycryptodomex termcolor

# Go ahead and run JWT_Tool once to perform initial configuration.
# See https://stackoverflow.com/a/30717108 for kludge details.
RUN source /opt/jwt_tool-venv/bin/activate && \
    jwt_tool.py; exit 0
