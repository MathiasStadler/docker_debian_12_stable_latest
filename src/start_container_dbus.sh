#!/bin/bash
docker run -ti \
--cap-add SYS_ADMIN \
--cap-add  CAP_SYS_MODULE \
--security-opt apparmor=unconfined \
--tmpfs /run \
--tmpfs /tmp \
--volume /sys/fs/cgroup:/sys/fs/cgroup:rw \
--device /dev/dri \
--volume /dev/shm:/dev/shm \
--cgroupns=host \
docker_debian_slim_dbus bash