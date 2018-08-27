#/bin/bash

# Fix .netcore paths if dotnet is installed
if hash dotnet 2>/dev/null; then
    export PATH="$PATH:~/.dotnet/tools"
    export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
fi

cd /api
# dos2unix build.sh
dotnet cake build.cake