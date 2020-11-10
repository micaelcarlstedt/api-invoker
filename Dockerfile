FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /files/src
COPY files/src/*.csproj .
RUN dotnet restore

COPY files/src/* ./
RUN dotnet publish -c release -o /app --no-restore


FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["./api.invoker.app"]