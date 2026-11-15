# GuildOps

Jeu de gestion de guilde fantasy (Godot 4.7.2 .NET, C# / .NET 10), 100 % hors ligne : douze aventuriers, sept jours, des contrats à attribuer, des réclamations à traiter. Le dépôt sert de **base de travail** pour les ateliers INFAL114.

## Structure
- `src/GuildOps.Core` — moteur C# pur (aucune dépendance Godot). Données JSON embarquées depuis `game-data/`.
- `src/GuildOps.Game` — projet Godot (interface). Ouvrir avec l'éditeur **Godot 4.7.2 stable .NET** (pas l'édition standard) ; la première ouverture importe les ressources.
- `tests/GuildOps.Tests` — tests xUnit du moteur.
- `game-data/` — règles, héros, catalogue de quêtes et storylets (JSON).
- `docs/playtests/` — journaux de parties de référence (graine 1142026).
- `tools/` — scripts de contrôle de l'interface (`run-autoplay.sh`, `run-flow.sh`).
- `LICENSES/` — origine des visuels et licences.

## Commandes
```bash
dotnet test                       # tests du moteur, sans Godot
dotnet build src/GuildOps.Game    # compile le projet Godot (Godot.NET.Sdk 4.7.2, net10.0)
godot --path src/GuildOps.Game --import   # première fois : importe les ressources
godot --path src/GuildOps.Game    # lance le jeu (binaire Godot .NET)
tools/check.sh                    # restauration + compilation + tests (équivalent d'une CI)
tools/check.sh --offline          # idem, sans réseau, à partir du cache NuGet déjà rempli
tools/bench.sh                    # benchmark (≈ 1 min)
```
`GuildOps.Game` n'est volontairement pas dans `GuildOps.sln` : `dotnet test` ne dépend ainsi ni de Godot ni du paquet `Godot.NET.Sdk`.

**Windows** : les commandes `dotnet` et `godot` sont identiques (PowerShell ou terminal de l'éditeur). Les scripts `tools/*.sh` demandent Git Bash ou WSL ; sans eux, lancez directement les commandes `dotnet` qu'ils contiennent (voir leur contenu, une dizaine de lignes).

Préparation des postes et dépannage : voir `INSTALL-OFFLINE.md`. Licence du code : MIT (voir `LICENSE`).

## Intégration continue
`.github/workflows/ci.yml` restaure, compile, teste et publie les résultats de tests à chaque `push` et `pull request`. C'est une base minimale ; son équivalent local est `tools/check.sh`.

## Benchmark (test lent, ignoré par défaut)
```bash
GUILDOPS_SLOW=1 dotnet test --filter "Category=Slow"
```
Écrit `artifacts/benchmark-latest.md` (génération d'offres, meilleure affectation, partie complète sur 100 / 1 000 / 10 000 modèles de quêtes). `artifacts/` n'est pas versionné ; les temps ne se comparent que sur une même machine.

## Hors ligne
Aucun appel réseau, compte ou service. Seule la préparation (`dotnet restore`) nécessite Internet.
