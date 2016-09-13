- view: games
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: company
    type: string
    sql: ${TABLE}.company

  - dimension: console
    type: string
    sql: ${TABLE}.console

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [id, name]

