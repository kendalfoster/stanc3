# Identify 
if [ $1 = "mips64el" ]; then
  SHA="sha256:85cc1b0be45320410ea10e607c7db8d90f6448945b0e27675f3ea7150245d618"
elif [ $1 = "arm64" ]; then
  SHA="sha256:241805782f6acc79d623f4d0bbf09138bf700e2b1ff37fd7527b8411a932ea9c"
elif [ $1 = "ppc64el" ]; then
  SHA="sha256:52a733211ee03875fc7be1e16853d7752b8d2b39a239bce76a54d98eb58083cb"
elif [ $1 = "armhf" ]; then
  SHA="sha256:0fa3787e3fb8a0ef6d1a11cb388c0ed8ad3c8a196d680021d089de167db5c1c4"
elif [ $1 = "armel" ]; then
  SHA="sha256:e128ba728675e89404383b82b487f639baa70f0d25c0d1db8c6eb34f9a23b920"
else
  SHA=$1
fi

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker run --volumes-from=$(docker ps -q):rw andrjohns/stanc3-building:latest@$SHA /bin/bash -c "cd $(pwd) && eval \$(opam env) && dune build @install --profile static"

