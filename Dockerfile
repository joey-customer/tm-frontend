FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore 

# copy and publish app and libraries
COPY * .
RUN dotnet publish -c release -o /app --no-restore 
RUN cp run.bash /app
RUN ls -alrt /app

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app
COPY --from=build /app .

RUN ls -alrt

ENTRYPOINT ["./run.bash"]

EXPOSE 8080