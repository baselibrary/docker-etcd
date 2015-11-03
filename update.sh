#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do	
  fullVersion="$(git ls-remote --tags https://github.com/coreos/etcd.git | cut -d$'\t' -f2 | grep -E '^refs/tags/v'"${version}"'.[0-9]$' | cut -dv -f2 | sort -rV | head -n1 )"
  echo $fullVersion
  (
		set -x
		cp docker-entrypoint.sh "$version/"
		sed '
			s/%%ETCD_MAJOR%%/'"$version"'/g;
			s/%%ETCD_VERSIONS%%/'"$fullVersion"'/g;
		' Dockerfile.template > "$version/Dockerfile"
	)
done
