connection: "video_games"

explore: locations {
}

view: locations {

derived_table: {
  sql:  SELECT
  36.974238 as lat,-122.026338 as long, 'Looker HQ' as name
  union
36.963836,-122.018588, 'Santa Cruz Boardwalk'
union
37.774367,-122.407404, 'Looker SF Office'
  ;;
}
dimension: lat {
  type: number
}
dimension: long {
  type: number
}
dimension: name {}
}
