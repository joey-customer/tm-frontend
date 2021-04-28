#!/bin/bash

export ASPNETCORE_URLS="https://localhost:${PORT}"
dotnet tm-frontend.dll
