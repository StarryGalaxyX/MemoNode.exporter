#!/bin/bash
MEFS_PATH={{ node_root }}/.{{ node_release }} nohup {{ node_root }}/{{ node_release }} daemon start --api={{ api }} --swarm-port={{ swarm_prot }} --group={{ group }} > {{ node_root }}/{{node_release}}.log 2>&1 &