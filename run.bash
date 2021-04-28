#!/bin/bash

export ASPNETCORE_URLS="http://localhost:${PORT}"
dotnet tm-frontend.dll
