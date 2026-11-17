import json
from pathlib import Path

chemin = Path("tests/evenements-4625.json")
# utf-8-sig : PowerShell 5.1 écrit un BOM au début du fichier
donnees = json.loads(chemin.read_text(encoding="utf-8-sig"))

print(f"{len(donnees)} événement(s) 4625 lu(s)")
for e in donnees:
    print(
        e["horodatage"],
        e["compte"],
        "type",
        e["type_connexion"],
        "ip",
        e["ip_source"],
        "sous-statut",
        e["sous_statut"],
    )