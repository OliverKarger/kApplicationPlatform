# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-20230912-windowsservercore-ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

# --- Install Chocolatey ---
RUN Set-ExecutionPolicy Bypass -Scope Process -Force ; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# --- Install tooling ---
RUN choco install -y cmake ninja python3

# --- Install Conan 2 ---
RUN pip install conan==2.*

# --- Create build user and workspace ---
RUN net user builder "Password123!" /add ; `
    mkdir C:\workspace
WORKDIR C:/workspace
USER builder
