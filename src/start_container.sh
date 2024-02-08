#!/bin/bash
docker run -ti \
--cap-add SYS_ADMIN \
--cap-add  CAP_SYS_MODULE \
--security-opt apparmor=unconfined \
--tmpfs /run \
--tmpfs /tmp \
--volume /sys/fs/cgroup:/sys/fs/cgroup:rw \
--device /dev/snd \
--device /dev/dri \
--volume /dev/shm:/dev/shm \
--cgroupns=host \
--env PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
--volume ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
--volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--group-add $(getent group audio | cut -d: -f3) \
docker_debian_slim_dbus_sound bash