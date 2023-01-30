FROM ubuntu:22.10

ARG TARGETARCH

# Create non-priviledged user.
#
# Flags:
#     -l: Do not add user to lastlog database.
#     -m: Create user home directory if it does not exist.
#     -s /usr/bin/bash: Set user login shell to Bash.
#     -u 1000: Give new user UID value 1000.
RUN useradd -lm -s /bin/bash -u 1000 ubuntu

# Install Bash, Curl, and Sudo.
#
# Flags:
#     -m: Ignore missing packages and handle result.
#     -q: Produce log suitable output by omitting progress indicators.
#     -y: Assume "yes" as answer to all prompts and run non-interactively.
RUN apt-get update -m && apt-get install -qy bash curl sudo

# Avoid APT interactively requesting to configure tzdata.
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# Add standard user to sudoers group.
RUN usermod -a -G sudo ubuntu

# Allow sudo commands with no password.
RUN printf "%%sudo ALL=(ALL) NOPASSWD:ALL\n" >> /etc/sudoers

# Fix current sudo bug for containers.
# https://github.com/sudo-project/sudo/issues/42
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

ENV HOME=/home/ubuntu USER=ubuntu
USER ubuntu

# Install Bootware.
COPY bootware.sh /usr/local/bin/bootware

# Install dependencies for Bootware.
RUN bootware setup

# Create bootware project directory.
RUN mkdir $HOME/bootware
WORKDIR $HOME/bootware

# Copy bootware project files.
COPY --chown="${USER}" group_vars/ ./group_vars/
COPY --chown="${USER}" playbook.yaml ./
COPY --chown="${USER}" roles/ ./roles/

ARG skip
ARG tags
ARG test

# VSCode, when run inside of a container, will falsely warn the user about the
# issues of running inside of the WSL and force a yes or no prompt.
ENV DONT_PROMPT_WSL_INSTALL='true'

# Run Bootware bootstrapping.
RUN bootware bootstrap --dev --no-passwd \
    --retries 3 ${skip:+--skip $skip} --tags ${tags:-desktop,extras}

# Copy bootware test files for testing.
COPY --chown="${USER}" tests/ ./tests/

# Set Bash as default shell.
SHELL ["/bin/bash", "-c"]

# Test installed binaries for roles.
#
# Flags:
#   -n: Check if the string has nonzero length.
RUN if [[ -n "$test" ]]; then \
        source "${HOME}/.bashrc"; \
        if [[ ! -x "$(command -v node)" ]]; then \
            sudo apt-get install -qy nodejs; \
        fi; \
        node tests/integration/roles.spec.js --arch "${TARGETARCH}" ${skip:+--skip $skip} ${tags:+--tags $tags} "ubuntu"; \
    fi
