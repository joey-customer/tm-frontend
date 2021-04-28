#!/bin/bash

export ASPNETCORE_URLS="http://*:${PORT}"
dotnet tm-frontend.dll
