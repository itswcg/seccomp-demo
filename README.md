# seccomp-demo

```shell
docker run -d --cap-add sys_ptrace -p2222:22 -p8730:873 --name seccomp-demo docker.io/library/seccomp-demo
```