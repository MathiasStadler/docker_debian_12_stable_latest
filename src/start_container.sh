#!/bin/bash
docker run -ti \
--cap-add SYS_ADMIN \
--cap-add  CAP_SYS_MODULE \
--security-opt apparmor=unconfined \
--tmpfs /run \
-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
docker_debian_slim_dbus bash