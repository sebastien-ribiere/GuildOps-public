# Installation hors ligne

Le jeu et les tests ne demandent aucune connexion. Seule la **préparation** du poste (une fois, avec Internet) en a besoin.

## Prérequis à installer avant le cours
| Outil | Version | Usage |
| --- | --- | --- |
| SDK .NET | 10.x (LTS) | `dotnet test`, compilation |
| Godot **.NET** (« mono ») | 4.7.2 stable | lancer et éditer le jeu (pas l'édition standard) |
| Un éditeur C# | au choix | VS Code, Rider, Visual Studio |

## Préparer le cache NuGet (avec Internet, une fois)
```bash
dotnet restore GuildOps.sln
dotnet restore src/GuildOps.Game/GuildOps.Game.csproj
```
Les paquets sont alors dans le cache utilisateur (`~/.nuget/packages`, `%USERPROFILE%\.nuget\packages` sous Windows). Ne coupez le réseau qu'après cette étape.

## Vérifier, réseau coupé
```bash
dotnet test --no-restore          # tests du moteur
tools/check.sh --offline          # restauration locale + compilation + tests
```

## Lancer le jeu depuis les sources
```bash
cd src/GuildOps.Game
godot --path . --import           # première fois seulement : importe les ressources
godot --path .
```
(`godot` = l'exécutable Godot **.NET**.) Sous Windows, remplacez par le chemin de `Godot_v4.7.2-stable_mono_win64.exe`.

## Dépannage rapide
| Symptôme | Cause probable | Action |
| --- | --- | --- |
| `dotnet` introuvable ou SDK inférieur à 10 | SDK absent | installer le SDK .NET 10 |
| `error NU1101` / restauration impossible | cache NuGet vide, pas de réseau | refaire la préparation avec Internet |
| Godot s'ouvre mais le projet n'a pas de C# | édition standard installée | installer l'édition **.NET** |
| Écran vide ou erreur de polices au lancement | ressources non importées | `godot --path src/GuildOps.Game --import` |
| Permission refusée sur le binaire | bit exécutable absent | `chmod +x` |
| Fenêtre noire ou plantage au lancement | pilote graphique | mettre à jour le pilote ; essayer `--rendering-driver opengl3` |
| Antivirus bloque l'exécutable | exécutable non signé | demander une exception à l'administrateur |
