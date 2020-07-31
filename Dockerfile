# hadolint ignore=DL3007
FROM nickodell/docker-github-actions-runner:base
LABEL maintainer="nickodell@gmail.com"

ARG GH_RUNNER_VERSION="2.262.1"
ARG TARGETPLATFORM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /actions-runner
COPY install_actions.sh /actions-runner

RUN chmod +x /actions-runner/install_actions.sh \
  && /actions-runner/install_actions.sh ${GH_RUNNER_VERSION} ${TARGETPLATFORM} \
  && rm /actions-runner/install_actions.sh

SHELL ["/bin/sh", "-c"]

RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    && pip3 install wheel

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
