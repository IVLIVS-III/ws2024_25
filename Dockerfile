# Use the original code-server image as the base
FROM codercom/code-server:latest

# Install dependencies and Python 3
# RUN sudo apt-get update && \
#     sudo apt-get install -y python3 python3-dev

    # Install Python 3.13 using the deadsnakes PPA
# RUN sudo apt-get update && \
#     sudo apt-get install -y software-properties-common && \
#     sudo add-apt-repository ppa:deadsnakes/ppa && \
#     sudo apt-get update && \
#     # sudo apt-get install -y python3.13 python3.13-venv python3.13-distutils && \
#     sudo apt-get install -y python3.13 && \
#     sudo apt-get clean && \
#     sudo rm -rf /var/lib/apt/lists/*

# Install dependencies and Python 3.13
RUN sudo apt-get update && \
    sudo apt-get install -y wget build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev \
    libgdbm-dev
RUN wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz && \
    tar -xf Python-3.13.0.tgz && \
    cd Python-3.13.0 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    sudo make altinstall && \
    cd ..  && \
    sudo rm -rf Python-3.13.0* && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Verify Python installation
RUN python3 --version
