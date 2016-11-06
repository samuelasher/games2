view: games {
# Want to remove platform, console company,
# and remove the sql necessary in name, console

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: parameter_taker {
    hidden: yes
    sql: {%parameter name%};;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: console {
    type: string
    hidden: no
    sql: TRIM(Replace(Replace(Replace(${TABLE}.console,'\t',''),'\n',''),'\r','')) ;;
    link: {
      url: "/explore/games/games?fields=games.year,games.name&f[games.console]={{ value | url_encode }}&show=data"
      label: "Games of this Console"
    }
    link: {
      url: "/dashboards/3?Console%20Name={{ value | url_encode }}"
      label: "Console Lookup Dashboard"
    }

  }

  dimension: name {
    type: string
    sql: REPLACE(${TABLE}.name,'Pok?', 'Poké') ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }


  dimension: series {
    type: string
    alpha_sort: yes
    case: {
      when: {
        sql: (${name} LIKE '%Mario %'
                  OR ${name} LIKE '%Luigi%'
                  OR ${name} LIKE '%Marios%' )
                  AND ${name} NOT LIKE '%Andretti%'
                  AND ${name} NOT LIKE '%Lemieux%';;
        label: "Mario"
      }
      when: {
        sql: ${name} LIKE '%Fire%Emblem%' ;;
        label: "Fire Emblem"
      }

      when: {
        sql: ${name} LIKE '%Sonic %'
                  AND ${name} != 'Sonic Spike'
                  AND ${name} != 'Sonic Boom'
                  AND ${name} != 'Sonic Eraser'
                  AND ${name} != 'Sonic Invaders'
                  AND ${name} NOT LIKE '%Sonic Princess%'
                  AND ${name} NOT LIKE '%Sonic Wings%'
                  AND ${name} NOT LIKE '%Supersonic%'
                  AND ${name} NOT LIKE 'Sonic Blast Man%';;
        label: "Sonic the Hedgehog"
      }

      when: {
        sql: ${name} LIKE '%Zelda%' ;;
        label: "The Legend of Zelda"
      }
      when: {
        sql: ${name} LIKE '%Pac-Man%' ;;
        label: "Pac-Man"
      }
      when: {
        sql: ${name} LIKE '%Pokémon%' ;;
        label: "Pokémon"
      }
      when: {
        sql: ${name} LIKE '%Mega Man%' ;;
        label: "Mega Man"
      }
      when: {
        sql: ${name} LIKE '%Street%Fighter%' ;;
        label: "Street Fighter"
      }
      when: {
        sql: ${name} LIKE '%Tetris%';;
        label: "Tetris"
      }

      when: {
        sql: ${name} LIKE '%Professor%Layton%';;
        label: "Professor Layton"
      }
      when: {
        sql: ${name} LIKE '%Ace%Attorney%';;
        label: "Phoenix Wright"
      }
      else: "Other"
    }
  }

  dimension: mascot_gif {
    label: "Series GIF icon with Title"
    group_label: "Images"
    #required_fields: [parameter_taker]
    sql: ${series};;
    html:
            <div style="width: 80px; text-align: center; margin: auto">
            <img src=
    {% if value == 'Other' %} "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game%25animated%25gif"
    {% else %}  "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ value | url_param_escape }}%25video%25game%25animated%25gif"
    {% endif %}
            alt="{{value}}" style="height: 75px; width: 75px; border-radius: 8px; margin-bottom: 5px;" />
            </br>{{ value }}
            </div>
             ;;
  }

  dimension: mascot_gif_large {
    label: "Seires GIF"
    group_label: "Images"
    #required_fields: [parameter_taker]
    sql: ${series};;
    html:
            <div style="width: 200px; text-align: center; margin: auto">
            <img src=
       {% if value == 'Other' %} "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game%25animated%25gif"
{% else %}  "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ value | url_param_escape }}%25video%25game%25animated%25gif"
{% endif %}
            alt="{{value}}" style="height: 200px; width: 200px; border-radius: 20px; margin-bottom: 5px;" />
            </div>
             ;;
  }
  dimension: mascot_image {
    label: "Series Image"
    group_label: "Images"
    #required_fields: [parameter_taker]
    sql: ${series};;
    html:
            <div style="width: 300px; text-align: center; margin: auto">
            <img src=
            {% if value == 'Other' %} "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game"
    {% else %}  "https://feeling-lucky-looker.herokuapp.com/api.php?q={{ value | url_param_escape }}%25video%25game"
            {% endif %}
            alt="{{value}}" style=" max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
            </div>
             ;;
  }
  dimension:  is_virtual_console {
    type: yesno
    hidden: yes
    sql: ${year} < ${consoles.release_year} ;;
  }

  measure: count {
    type: count
    drill_fields: [console, name, year]
  }
  measure: count_consoles {
    type: count_distinct
    drill_fields: [console]
    sql: ${console} ;;
  }

  measure: count_companies {
    type: count_distinct
    drill_fields: [company]
    sql: ${company} ;;
  }
  measure: earliest_year {
    type: min
    sql:  ${year}  ;;
  }
  measure: latest_year {
    type: max
    sql:  ${year}  ;;
  }

}
