#!/bin/bash
# À exécuter UNE FOIS avec Internet : remplit le cache NuGet (moteur, tests, projet Godot) pour pouvoir travailler ensuite sans réseau.
set -euo pipefail
cd "$(dirname "$0")/.."
dotnet restore GuildOps.sln
dotnet restore src/GuildOps.Game/GuildOps.Game.csproj
echo "Cache NuGet prêt : vous pouvez couper le réseau (tools/check.sh --offline)."
