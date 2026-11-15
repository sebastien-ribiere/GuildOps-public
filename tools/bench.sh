#!/bin/bash
# Benchmark du moteur : génération d'offres, meilleure affectation et partie complète sur 100 / 1 000 / 10 000 modèles de quêtes.
# Durée : environ 1 minute. Écrit artifacts/benchmark-latest.md (non versionné). Comparer uniquement sur une même machine.
set -euo pipefail
cd "$(dirname "$0")/.."
GUILDOPS_SLOW=1 dotnet test tests/GuildOps.Tests --filter "Category=Slow" --nologo "$@"
echo; cat artifacts/benchmark-latest.md
