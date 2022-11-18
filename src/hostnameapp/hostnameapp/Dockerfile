#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS base
WORKDIR /app
ENV ASPNETCORE_URLS http://+:5000
# EXPOSE 80
EXPOSE 5000
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src

COPY ["hostnameapp.csproj", "."]
RUN dotnet restore "hostnameapp.csproj"
COPY . .
#WORKDIR "hostnameapp"
RUN dotnet build "hostnameapp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "hostnameapp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "hostnameapp.dll"]