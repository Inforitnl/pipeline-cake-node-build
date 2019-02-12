#!/bin/bash

cd /api || return

# Add nuget source if access token is set
if [ -n "$MYGET_ACCESS_TOKEN" ]
then
    echo "Adding inforit nuget source"
    SOURCE="https://www.myget.org/F/inforit/auth/$MYGET_ACCESS_TOKEN/api/v3/index.json"
    VAR=$(sed "/<\/packageSources>/i <add key=\"inforit.org\" value=\"$SOURCE\" protocolVersion=\"3\" />" ~/.nuget/NuGet/NuGet.Config)
    echo "$VAR" > ~/.nuget/NuGet/NuGet.Config
fi

# Run dotnet cake
dotnet cake build.cake