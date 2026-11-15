#!/bin/bash
# Contrôle local : restauration, compilation sans avertissement, tests du moteur. Sert de référence pour une CI :
# les étapes d'un pipeline sont exactement celles-ci. Option --offline : n'utilise que le cache NuGet local.
set -euo pipefail
cd "$(dirname "$0")/.."
RESTORE=(dotnet restore GuildOps.sln -v q)
[ "${1:-}" = "--offline" ] && RESTORE=(dotnet restore GuildOps.sln -v q --source "$HOME/.nuget/packages")
echo "== 1/3 restauration =="; "${RESTORE[@]}"
echo "== 2/3 compilation =="; dotnet build GuildOps.sln --no-restore -c Release -warnaserror -v q --nologo
echo "== 3/3 tests =="; dotnet test GuildOps.sln --no-build -c Release --nologo
echo "CONTRÔLE OK"
