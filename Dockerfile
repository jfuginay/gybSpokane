FROM balenalib/raspberrypi4-64-python:3.9-run

# Install system dependencies
RUN install_packages \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    git \
    wget

# Create virtual environment
RUN python3 -m venv /opt/venv

# Bootstrap pip properly
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    /opt/venv/bin/python get-pip.py && \
    rm get-pip.py

# Install taky
RUN /opt/venv/bin/pip install taky

# Create necessary directories
RUN mkdir -p /var/taky /data/taky/uploads /etc/taky

# Copy configuration files
COPY taky.conf /etc/taky/
COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
