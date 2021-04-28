FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /source

# copy csproj and restore as distinct layers
COPY tm-frontend.sln .
COPY tm-frontend/. ./tm-frontend
COPY tm-frontend-test/. ./tm-frontend-test

RUN dotnet restore
RUN dotnet publish -c release -o /app --no-restore 
COPY run.bash /app
RUN ls -alrt /app

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app
COPY --from=build /app .

RUN ls -alrt

ENTRYPOINT ["./run.bash"]

EXPOSE 8080