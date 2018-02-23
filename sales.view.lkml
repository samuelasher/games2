view: sales {
  sql_table_name: lookvr_vg.sales ;;

  dimension: id {
    primary_key: yes
    type: number
#    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: eu_sales {
    hidden: yes
    type: number
    sql: ${TABLE}.eu_sales ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: global_sales {
    hidden: yes
    type: number
    sql: ${TABLE}.global_sales ;;
  }

  dimension: jp_sales {
    type: number
    hidden: yes
    sql: ${TABLE}.jp_sales ;;
  }

  dimension: na_sales {
    hidden: yes
    type: number
    sql: ${TABLE}.na_sales ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_sales {
    hidden: yes
    type: number
    sql: ${TABLE}.other_sales ;;
  }

  dimension: console {
    type: string
    sql: ${TABLE}.platform ;;
    link: {
      url: "/dashboards/3?Console%20Name={{ value | url_encode }}"
      label: "Console Lookup Dashboard"
    }
  }

  dimension: console_manufacturer {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [name, console]
  }
  measure: total_na_sales {
    type:  sum
    sql:  ${na_sales} ;;
    label: "North America Sales"
    value_format_name: usd_0
  }
  measure: total_jp_sales {
    type:  sum
    sql:  ${jp_sales} ;;
    label: "Japan Sales"
    value_format_name: usd_0
  }
  measure: total_eu_sales {
    type:  sum
    sql:  ${eu_sales} ;;
    label: "Europe Sales"
    value_format_name: usd_0
  }
  measure: total_other_sales {
    type:  sum
    sql:  ${other_sales} ;;
    label: "Other Sales"
    value_format_name: usd_0
  }
  measure: total_global_sales {
    type:  sum
    sql:  ${global_sales} ;;
    label: "Global Sales"
    value_format_name: usd_0
  }
}
