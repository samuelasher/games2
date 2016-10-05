connection: "postgres-local-sam"
include: "*.view.lkml"
include: "*.dashboard.lkml"
persist_for: "99999 hours"
explore: games {}
