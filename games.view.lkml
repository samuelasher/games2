view: games {
  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: console {
    type: string
    hidden: yes
    sql: TRIM(Replace(Replace(Replace(${TABLE}.console,'\t',''),'\n',''),'\r','')) ;;
    link: {
      url: "/explore/games/games?fields=games.year,games.name&f[games.console]={{ value | url_encode }}&show=data"
      label: "Games of this Console"
    }
  }

  dimension: console_bucketed {
    label: "Console"
    drill_fields: [company, name, series, year]
    type: string
    sql: CASE WHEN ${platform} = 'Computer' THEN 'Computer'
         ELSE ${console} END;;
  }


  dimension: platform {
    type: string
    alpha_sort: yes
    drill_fields: [console_bucketed, company, name, series, year]
    case: {
      when: {
        sql: ${console} LIKE '%GameCube%'
                  OR ${console} LIKE '%PlayStation%'
                  OR ${console} LIKE '%Atari%00%'
                  OR ${console} LIKE '%3DO%'
                  OR ${console} LIKE '%Wii%'
        OR ${console} LIKE '%Casio%'
        OR ${console} LIKE '%Dreamcast%'
        OR ${console} LIKE '%Epoch%Cassette%'
        OR ${console} LIKE '%Channel F%'
        OR ${console} LIKE '%Coleco%'
        OR ${console} LIKE '%Game Wave%'
        OR ${console} LIKE '%Genesis%'
        OR ${console} LIKE '%Intellivision%'
        OR ${console} LIKE '%Jaguar%'
        OR ${console} LIKE '%Nintendo%64%'
        OR ${console} LIKE '%NES%'
        OR ${console} LIKE '%Nuon%'
        OR ${console} LIKE '%Odyssey%'
        OR ${console} LIKE '%Ouya%'
        OR ${console} LIKE '%PC-FX%'
        OR ${console} LIKE '%Pippin%'
        OR ${console} LIKE '%RCA Studio%'
        OR ${console} LIKE '%SEGA%'
        OR ${console} LIKE '%SG-1000%'
        OR ${console} LIKE '%Super Acan%'
        OR ${console} LIKE '%SuperGraf%'
        OR ${console} LIKE '%TurboGraf%'
        OR ${console} LIKE '%V.Smile%'
        OR ${console} LIKE '%Videopac%'
        OR ${console} LIKE '%Virtual Boy%'
        OR ${console} LIKE '%Xbox%'
        OR ${console} LIKE '%Zeebo%'
                       ;;
        label: "Home Console"
      }
      when: {
        sql: ${console} LIKE '%Game%Boy%'
                  OR ${console} LIKE '%Epoch%Pocket%'
                  OR ${console} LIKE '%Game Gear%'
                  OR ${console} LIKE '%Game.Com%'
                  OR ${console} LIKE '%Gizmondo%'
                  OR ${console} LIKE '%GP2X%'
                  OR ${console} LIKE '%GP32%'
                  OR ${console} LIKE '%Lynx%'
                  OR ${console} LIKE '%Microvision%'
                  OR ${console} LIKE '%Neo Geo Pocket%'
                  OR ${console} LIKE '%Nintendo%DS%'
                  OR ${console} LIKE '%PSP%'
                  OR ${console} LIKE '%PS Vita%'
                  OR ${console} LIKE '%Supervision%'
                  OR ${console} LIKE '%TI-99%'
                  OR ${console} LIKE '%WonderSwan%'
                  OR ${console} LIKE '%Zodiac%'
                                 ;;
        label: "Handheld"
      }
      when: {
        sql: ${console} LIKE '%bada%'
                  OR ${console} LIKE '%Android%'
                  OR ${console} LIKE '%iOS%'
                  OR ${console} LIKE '%N-Gage%'
                  OR ${console} LIKE '%Kindle%'
                  OR ${console} LIKE '%iPhone%'
        OR ${console} LIKE '%BlackBerry%'
        OR ${console} LIKE '%BREW%'
        OR ${console} LIKE '%iPad%'
        OR ${console} LIKE '%iPod%'
        OR ${console} LIKE '%Palm%'
        OR ${console} LIKE '%Symbian%'
        OR ${console} LIKE '%Windows Mobile%'
        OR ${console} LIKE '%Windows Phone%'
                    ;;
        label: "Phone/Tablet"
      }
      when: {
        sql: ${console} LIKE '%Dragon 32%'
                  OR ${console} LIKE '%Apple%'
                  OR ${console} LIKE '%Amiga%'
                  OR ${console} LIKE '%Amstrad%'
                  OR ${console} LIKE '%Acorn%'
                  OR ${console} LIKE '%Atari 8-bit%'
                  OR ${console} LIKE '%Atari ST%'
        OR ${console} LIKE '%BBC%'
        OR ${console} LIKE '%Atom%'
        OR ${console} LIKE '%Browser%'
        OR ${console} LIKE '%Commodore%'
        OR ${console} LIKE '%DOS%'
        OR ${console} LIKE '%DoJa%'
        OR ${console} LIKE '%Electron%'
        OR ${console} LIKE '%FM%'
        OR ${console} LIKE '%CD-i%'
        OR ${console} LIKE '%CDTV%'
        OR ${console} LIKE '%J2ME%'
        OR ${console} LIKE '%Macintosh%'
        OR ${console} LIKE '%Aquarius%'
        OR ${console} LIKE '%Linux%'
        OR ${console} LIKE '%Mophun%'
        OR ${console} LIKE '%MSX%'
        OR ${console} LIKE '%Neo Geo'
        OR ${console} LIKE '%Neo Geo CD'
        OR ${console} LIKE '%Oric%'
        OR ${console} LIKE '%PC Booter%'
        OR ${console} LIKE '%PC-%8%'
        OR ${console} LIKE '%Philips VG 5000%'
        OR ${console} LIKE '%Plus%'
        OR ${console} LIKE '%SAM Coup%'
        OR ${console} LIKE '%Sharp%'
        OR ${console} LIKE '%Sinclair%'
        OR ${console} LIKE '%Sord M5%'
        OR ${console} LIKE '%Spectravideo%'
        OR ${console} LIKE '%Thomson%'
        OR ${console} LIKE '%TRS-80%'
        OR ${console} LIKE '%Vectrex%'
        OR ${console} LIKE '%VIC-20%'
        OR ${console} LIKE '%webOS%'
        OR ${console} LIKE '%Windows'
        OR ${console} LIKE '%Windows 3.x%'
        OR ${console} LIKE '%ZX%'
                    ;;
        label: "Computer"
      }
      when: {
        sql: ${console} LIKE '%Arcade%'
          ;;
        label: "Arcade"
      }
      else: "Other"
    }
  }

  dimension: console_company {
    type: string
    alpha_sort: yes
    drill_fields: [platform, console_bucketed, company, name, series, year]

    case: {
      when: {
        sql: ${console} LIKE '%Nintendo%'
                  OR ${console} LIKE '%GameCube%'
                  OR ${console} LIKE '%Game Boy%'
                  OR ${console} LIKE '%NES'
                  OR ${console} LIKE 'Virtual Boy'
                  OR ${console} LIKE 'Wii%'
                       ;;
        label: "Nintendo"
      }
      when: {
        sql: ${console} LIKE '%PlayStation%'
                  OR ${console} LIKE 'PS%'
                    ;;
        label: "Sony"
      }
      when: {
        sql: ${console} LIKE '%Arcade%'
          ;;
        label: "Arcade"
      }
      when: {
        sql: ${console} LIKE '%Atari%'
                  OR ${console} LIKE '%Jaguar%'
                  OR ${console} LIKE '%Lynx%'
                    ;;
        label: "Atari"
      }
      when: {
        sql: ${console} LIKE '%Amstrad%'
          ;;
        label: "Amstrad"
      }
      when: {
        sql: ${console} LIKE '%Acorn%'
                  OR ${console} LIKE '%Atom%'
                  OR ${console} LIKE '%Electron%'
                  OR ${console} LIKE '%BBC Micro%'
                              ;;
        label: "Acorn"
      }
      when: {
        sql: ${console} LIKE '%Android%'
          ;;
        label: "Google"
      }
      when: {
        sql: ${console} LIKE '%Amiga%'
                  OR ${console} LIKE '%Commodore%'
                  OR ${console} LIKE '%CDTV%'
        OR ${console} LIKE '%Plus/4%'
        OR ${console} LIKE '%VIC-20%'
                    ;;
        label: "Commodore"
      }
      when: {
        sql: ${console} LIKE '%3DO%'
          ;;
        label: "Panasonic"
      }
      when: {
        sql: ${console} LIKE '%Apple%'
                  OR ${console} LIKE '%iPad%'
                  OR ${console} LIKE '%iPod%'
                  OR ${console} LIKE '%iPhone%'
                  OR ${console} LIKE '%Macintosh%'
                  OR ${console} LIKE '%Pippin%'
                    ;;
        label: "Apple"
      }
      when: {
        sql: ${console} LIKE '%bada%'
          ;;
        label: "Samsung"
      }
      when: {
        sql: ${console} LIKE '%BlackBerry%'
          ;;
        label: "BlackBerry"
      }
      when: {
        sql: ${console} LIKE '%Browser%'
          ;;
        label: "Broswer"
      }
      when: {
        sql: ${console} LIKE '%BREW%'
          ;;
        label: "Qualcomm"
      }
      when: {
        sql: ${console} LIKE '%Casio%'
          ;;
        label: "Casio"
      }
      when: {
        sql: ${console} LIKE '%CD-i%'
          ;;
        label: "Philips, Sony, Magnavox"
      }
      when: {
        sql: ${console} LIKE '%Channel F%'
          ;;
        label: "Fairchild"
      }
      when: {
        sql: ${console} LIKE '%DoJa%'
          ;;
        label: "DoJa"
      }
      when: {
        sql: ${console} LIKE '%DOS%'
                  OR ${console} LIKE '%MSX%'
                  OR ${console} LIKE 'Window%'
                  OR ${console} LIKE 'Xbox%'
                    ;;
        label: "Microsoft"
      }
      when: {
        sql: ${console} LIKE '%Coleco%'
          ;;
        label: "Coleco"
      }
      when: {
        sql: ${console} LIKE '%Dragon%'
          ;;
        label: "Dragon"
      }
      when: {
        sql: ${console} LIKE '%Epoch%'
          ;;
        label: "Epoch"
      }
      when: {
        sql: ${console} LIKE '%Dreamcast%'
                  OR ${console} LIKE '%Genesis%'
                  OR ${console} LIKE '%SEGA%'
                  OR ${console} LIKE '%Game Gear%'
                  OR ${console} LIKE '%SG-1000%'
                    ;;
        label: "SEGA"
      }
      when: {
        sql: ${console} LIKE '%ExEn%'
          ;;
        label: "ExEn"
      }
      when: {
        sql: ${console} LIKE '%FM%'
          ;;
        label: "Fujitsu"
      }
      when: {
        sql: ${console} LIKE '%Game Wave%'
          ;;
        label: "ZAPiT"
      }
      when: {
        sql: ${console} LIKE '%Game.Com%'
                  OR ${console} LIKE '%Gizmondo%'
                    ;;
        label: "Tiger"
      }
      when: {
        sql: ${console} LIKE '%GP%'
          ;;
        label: "Game Park"
      }
      when: {
        sql: ${console} LIKE '%Intellivision%'
                  OR ${console} LIKE '%Mattel%'
                    ;;
        label: "Mattel"
      }
      when: {
        sql: ${console} LIKE '%J2ME%'
          ;;
        label: "Oracle"
      }
      when: {
        sql: ${console} LIKE '%Kindle%'
          ;;
        label: "Amazon"
      }
      when: {
        sql: ${console} LIKE '%Linux%'
          ;;
        label: "Linux"
      }
      when: {
        sql: ${console} LIKE '%Microvision%'
                  OR ${console} LIKE '%Vectrex%'
                    ;;
        label: "Milton Bradley"
      }
      when: {
        sql: ${console} LIKE '%Mophun%'
          ;;
        label: "Synergenix"
      }
      when: {
        sql: ${console} LIKE '%N-Gage%'
                  OR ${console} LIKE '%Symbian%'
                    ;;
        label: "Nokia"
      }
      when: {
        sql: ${console} LIKE '%Neo Geo%'
          ;;
        label: "SNK"
      }
      when: {
        sql: ${console} LIKE '%Nuon%'
          ;;
        label: "VM Labs"
      }
      when: {
        sql: ${console} LIKE '%Odyssey%'
          ;;
        label: "Magnavox, Philips"
      }
      when: {
        sql: ${console} LIKE '%Oric%'
          ;;
        label: "Tangerine"
      }
      when: {
        sql: ${console} LIKE 'Ouya'
          ;;
        label: "Ouya"
      }
      when: {
        sql: ${console} LIKE '%Palm%'
          ;;
        label: "Palm"
      }
      when: {
        sql: ${console} LIKE '%PC-%'
                  OR ${console} LIKE '%Grafx%'
                    ;;
        label: "NEC"
      }
      when: {
        sql: ${console} LIKE '%Philips%'
                  OR ${console} LIKE '%Videopac%'
                    ;;
        label: "Philips"
      }
      when: {
        sql: ${console} LIKE '%RCA%'
          ;;
        label: "RCA"
      }
      when: {
        sql: ${console} LIKE '%Sharp%'
          ;;
        label: "Sharp"
      }
      when: {
        sql: ${console} LIKE '%TRS-80%'
          ;;
        label: "Tandy"
      }
      when: {
        sql: ${console} LIKE '%WonderSwan%'
          ;;
        label: "Bandai"
      }
      when: {
        sql: ${console} LIKE '%ZX%'
                  OR  ${console} LIKE '%Sinclair%'
                    ;;
        label: "Sinclair"
      }
      when: {
        sql: ${console} LIKE '%Zodiac%'
          ;;
        label: "Tapwave"
      }
      when: {
        sql: ${console} LIKE '%Zeebo%'
          ;;
        label: "Zeebo"
      }
      when: {
        sql: ${console} LIKE '%webOS%'
          ;;
        label: "LG"
      }
      when: {
        sql: ${console} LIKE '%Supervision%'
          ;;
        label: "Watara"
      }
      when: {
        sql: ${console} LIKE '%Super Acan%'
          ;;
        label: "Funtech"
      }
      when: {
        sql: ${console} LIKE '%V.Smile%'
          ;;
        label: "VTech"
      }
      when: {
        sql: ${console} LIKE '%TI-99%'
          ;;
        label: "Texas Instruments"
      }
      when: {
        sql: ${console} LIKE 'Sord%'
          ;;
        label: "Sord"
      }
      else: "Other"
    }
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension: company_bucketed {
    type: string
    sql: CASE WHEN ${company} LIKE '%Nintendo%' THEN 'Nintendo'
          WHEN ${company} LIKE '%Ubi%oft%' THEN 'Ubisoft'
    WHEN ${company} LIKE '%SEGA%' THEN 'SEGA'
    WHEN ${company} LIKE '%Sony%' THEN 'Sony'
    WHEN ${company} LIKE '%Capcom%' THEN 'Capcom'
    WHEN ${company} LIKE '%Atari%' THEN 'Atari'
    WHEN ${company} LIKE '%Microsoft%' THEN 'Microsoft'
    WHEN ${company} LIKE '%Square Enix%' THEN 'Square Enix'
    WHEN ${company} LIKE '%Electronic Arts%' THEN 'Electronic Arts'
    WHEN ${company} LIKE '%KOEI%' THEN 'KOEI'
    WHEN ${company} LIKE '%Konami%' THEN 'Konami'
    WHEN ${company} LIKE '%Activision%' THEN 'Activision'
            ELSE ${company} END;;
  }

  dimension: mascot {
    type: string
    alpha_sort: yes
    case: {
      when: {
        sql: ${name} LIKE '%Rayman%' ;;
        label: "Rayman"
      }
      when: {
        sql: ${name} LIKE '%Mario%' ;;
        label: "Mario"
      }
      when: {
        sql: ${name} LIKE '%Sonic%' ;;
        label: "Sonic the Hedgehog"
      }
      when: {
        sql: ${name} LIKE '%Kirby%' ;;
        label: "Kirby"
      }
      when: {
        sql: ${name} LIKE '%Metroid%' ;;
        label: "Samus"
      }
      when: {
        sql: ${name} LIKE '%Zelda%' ;;
        label: "Link"
      }
      when: {
        sql: ${name} LIKE '%Pac-Man%' ;;
        label: "Pac-Man"
      }
      when: {
        sql: ${name} LIKE '%Pok%mon%' ;;
        label: "Pikachu"
      }
      when: {
        sql: ${name} LIKE '%Mega Man%' ;;
        label: "Mega Man"
      }
      when: {
        sql: ${name} LIKE '%Street%Fighter%' ;;
        label: "Ryu"
      }
      when: {
        sql: ${name} LIKE '%Bonk%' ;;
        label: "Bonk"
      }
      when: {
        sql: ${name} LIKE '%Ratchet%Clank%' ;;
        label: "Ratchet & Clank"
      }
      when: {
        sql: ${name} LIKE '%Crash%Band%' ;;
        label: "Crash Bandicoot"
      }
      when: {
        sql: ${name} LIKE '%Donkey%Kong%';;
        label: "Donkey Kong"
      }
      when: {
        sql: ${name} LIKE '%Metal%Gear%';;
        label: "Solid Snake"
      }
      when: {
        sql: ${name} LIKE '%Castlevania%';;
        label: "Dracula"
      }
      when: {
        sql: ${name} LIKE '%Final%Fantasy%';;
        label: "Cactuar"
      }
      when: {
        sql: ${name} LIKE '%Luigi%';;
        label: "Luigi"
      }
      when: {
        sql: ${name} LIKE '%Tomb%Raider%';;
        label: "Lara Croft"
      }
      when: {
        sql: ${name} LIKE '%Tetris%';;
        label: "Tetris"
      }
      when: {
        sql: ${name} LIKE '%Mortal%Kombat%';;
        label: "Sub Zero"
      }
      when: {
        sql: ${name} LIKE '%Madden%';;
        label: "John Madden"
      }
      when: {
        sql: ${name} LIKE '%Resident%Evil%';;
        label: "Resident Evil"
      }
      when: {
        sql: ${name} LIKE '%Halo%';;
        label: "Master Chief"
      }
      when: {
        sql: ${name} LIKE '%Call of Duty%';;
        label: "Captain Price"
      }
      when: {
        sql: ${name} LIKE '%Worms%';;
        label: "Worms"
      }
      when: {
        sql: ${name} LIKE '%Duke%Nukem%';;
        label: "Duke Nukem"
      }
      when: {
        sql: ${name} LIKE '%Nathan%Drake%' OR ${name} LIKE '%Uncharted%';;
        label: "Nathan Drake"
      }
      when: {
        sql: ${name} LIKE '%Professor%Layton%';;
        label: "Professor Layton"
      }
      when: {
        sql: ${name} LIKE '%Ace%Attorney%';;
        label: "Phoenix Wright"
      }
      when: {
        sql: ${name} LIKE '%Dragon%Quest%';;
        label: "Slime"
      }
      when: {
        sql: ${name} LIKE '%Bomberman%' ;;
        label: "Bomberman"
      }
    }
  }

  dimension: series {
    type: string
    alpha_sort: yes
    case: {
      when: {
        sql: ${name} LIKE '%Mario%' OR ${mascot} LIKE '%Luigi%' ;;
        label: "Mario"
      }
      when: {
        sql: ${name} LIKE '%Rayman%' ;;
        label: "Rayman"
      }
      when: {
        sql: ${name} LIKE '%Sonic%' ;;
        label: "Sonic the Hedgehog"
      }
      when: {
        sql: ${name} LIKE '%Kirby%' ;;
        label: "Kirby"
      }
      when: {
        sql: ${name} LIKE '%Metroid%' ;;
        label: "Metroid"
      }
      when: {
        sql: ${name} LIKE '%Zelda%' ;;
        label: "The Legend of Zelda"
      }
      when: {
        sql: ${name} LIKE '%Bomberman%' ;;
        label: "Bomberman"
      }
      when: {
        sql: ${name} LIKE '%Pac-Man%' ;;
        label: "Pac-Man"
      }
      when: {
        sql: ${name} LIKE '%Pok%mon%' ;;
        label: "Pokemon"
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
        sql: ${name} LIKE '%Bonk%' ;;
        label: "Bonk"
      }
      when: {
        sql: ${name} LIKE '%Ratchet%Clank%' ;;
        label: "Ratchet & Clank"
      }
      when: {
        sql: ${name} LIKE '%Crash%Band%' ;;
        label: "Crash Bandicoot"
      }
      when: {
        sql: ${name} LIKE '%Donkey%Kong%';;
        label: "Donkey Kong"
      }
      when: {
        sql: ${name} LIKE '%Metal%Gear%';;
        label: "Metal Gear"
      }
      when: {
        sql: ${name} LIKE '%Castlevania%';;
        label: "Castlevania"
      }
      when: {
        sql: ${name} LIKE '%Final%Fantasy%';;
        label: "Final Fantasy"
      }
      when: {
        sql: ${name} LIKE '%Tomb%Raider%';;
        label: "Tomb Raider"
      }
      when: {
        sql: ${name} LIKE '%Tetris%';;
        label: "Tetris"
      }
      when: {
        sql: ${name} LIKE '%Mortal%Kombat%';;
        label: "Mortal Kombat"
      }
      when: {
        sql: ${name} LIKE '%Madden%';;
        label: "Madden NFL"
      }
      when: {
        sql: ${name} LIKE '%Resident%Evil%';;
        label: "Resident Evil"
      }

      when: {
        sql: ${name} LIKE '%Halo%';;
        label: "Halo"
      }
      when: {
        sql: ${name} LIKE '%Call of Duty%';;
        label: "Call of Duty"
      }
      when: {
        sql: ${name} LIKE '%Worms%';;
        label: "Worms"
      }
      when: {
        sql: ${name} LIKE '%Duke%Nukem%';;
        label: "Duke Nukem"
      }
      when: {
        sql: ${name} LIKE '%Nathan%Drake%' OR ${name} LIKE '%Uncharted%';;
        label: "Uncharted"
      }
      when: {
        sql: ${name} LIKE '%Professor%Layton%';;
        label: "Professor Layton"
      }
      when: {
        sql: ${name} LIKE '%Ace%Attorney%';;
        label: "Phoenix Wright"
      }
      when: {
        sql: ${name} LIKE '%Dragon%Quest%';;
        label: "Dragon Quest"
      }
    }
  }

  dimension: mascot_gif {
    sql: ${mascot};;
    html:

    <div style="width: 80px; text-align: center; margin: auto">
    <a href="{{mascot}}" target="_self">
    <img src=
    {% if value == 'Cactuar' %}
    "https://s11.postimg.org/7s4y777pv/ezgif_1339250537.gif"
    {% elsif value == 'Sonic the Hedgehog' %}
    "http://i.giphy.com/13nN1XlbXhqqTC.gif"
    {% elsif value == 'Mario' %}
    "http://i.giphy.com/YTtqB2j5EN7IA.gif"
    {% elsif value == 'Mega Man' %}
    "http://i.giphy.com/PK55P6udUmSPu.gif"
    {% elsif value == 'Captain Price' %}
    "http://i.giphy.com/T8rtfi2iK00IU.gif"
    {% elsif value == 'Pac-Man' %}
    "http://i.giphy.com/fkvSM0uNJwYww.gif"
    {% elsif value == 'John Madden' %}
    "http://i.giphy.com/kNdjr0nRPHxTO.gif"
    {% elsif value == 'Ryu' %}
    "https://s11.postimg.org/48fhy987n/ezgif_3577204249.gif"
    {% elsif value == 'Lara Croft' %}
    "http://i.giphy.com/WkuLHM3uGHSAE.gif"
    {% elsif value == 'Tetris' %}
    "http://i.giphy.com/CDkx9svvP5KGQ.gif"
    {% elsif value == 'Pikachu' %}
    "http://i.giphy.com/qcx4hzsY8n6FO.gif"
    {% elsif value == 'Worms' %}
    "http://i.giphy.com/j0tASyEf9wH6M.gif"
    {% elsif value == 'Resident Evil' %}
    "http://i.giphy.com/hji6ZMztu4unm.gif"
    {% elsif value == 'Sub Zero' %}
    "http://i.giphy.com/72v5BY3vFkSCA.gif"
    {% elsif value == 'Bomberman' %}
    "https://s18.postimg.org/gl37if915/ezgif_842190678.gif"
    {% elsif value == 'Donkey Kong' %}
    "http://i.giphy.com/8zjsQY3eS2WIw.gif"
    {% elsif value == 'Link' %}
    "https://s9.postimg.org/9nwg7eqsf/ezgif_3980330143.gif"
    {% elsif value == 'Kirby' %}
    "http://i.giphy.com/wRmOK4J2261gI.gif"
    {% elsif value == 'Dracula' %}
    "https://s15.postimg.org/3su4bhmob/ezgif_1970490436.gif"
    {% elsif value == 'Bonk' %}
    "https://s17.postimg.org/ln3t7dmpr/ezgif_4114690391.gif"
    {% elsif value == 'Solid Snake' %}
    "https://s21.postimg.org/r9iqv9giv/ezgif_1075249640.gif"
    {% elsif value == 'Duke Nukem' %}
    "http://i.giphy.com/PFDKWUsh5auQg.gif"
    {% elsif value == 'Master Chief' %}
    "http://i.giphy.com/RzYrhuxnoe91K.gif"
    {% elsif value == 'Crash Bandicoot' %}
    "https://s18.postimg.org/nu0r9jrtl/ezgif_2055134094.gif"
    {% elsif value == 'Samus' %}
    "https://s18.postimg.org/ldyxvp9qx/ezgif_3754811271.gif"
    {% elsif value == 'Nathan Drake' %}
    "http://i.giphy.com/WjchWfOoa4RUs.gif"
    {% elsif value == 'Ratchet & Clank' %}
    "https://s12.postimg.org/3psvj9c99/ezgif_2117624514.gif"
    {% elsif value == 'Phoenix Wright' %}
    "http://i.giphy.com/eXgOq9ZqvcHu.gif"
    {% elsif value == 'Luigi' %}
    "http://i.giphy.com/pbamSoMhpbL0I.gif"
    {% elsif value == 'Professor Layton' %}
    "https://s11.postimg.org/ubdtxjloz/ezgif_2375709908.gif"
    {% elsif value == 'Slime' %}
    "https://s9.postimg.org/y2ttxfqj3/ezgif_2678558225.gif"
    {% elsif value == 'Rayman' %}
    "http://i.giphy.com/bDUfHeBl80tLa.gif"
    {% else %}
    "https://jimpix.co.uk/ink/ecards/angif_pinkevich_catphones.gif"
    {% endif %}
    alt="{{series}}" style="height: 75px; width: 75px; border-radius: 15px; margin-bottom: 5px;" />
    </br>{{ series }}
    </div>
    </a> ;;
  }

  measure: count {
    type: count
    drill_fields: [console, name]
  }
  measure: count_consoles {
    type: count_distinct
    drill_fields: [console, name]
    sql:  ${console} ;;
  }

}
