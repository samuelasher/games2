view: games {


  filter: parameter_passer {
    default_value: "%"
  }
  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: parameter_taker {
    sql: {%parameter parameter_passer%};;
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
  dimension: console_picture {
    group_label: "Images"
    sql: ${console} ;;
    html: <img src="http://pokemon-master-trainer.herokuapp.com/api.php?q={{value | url_param_escape }}%25video%25game%25console"  style="max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
      ;;
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
    sql: REPLACE(${TABLE}.name,'Pok?', 'Poké') ;;
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
        sql: ${name} LIKE '% Sims%'
                  AND ${name} != 'My 3 Sims!'
                  AND ${name} != 'SimSafari';;
        label: "The Sims"
      }
      when: {
        sql: ${name} LIKE '%fifa%' ;;
        label: "FIFA Soccer"
      }
      when: {
        sql: ${name} LIKE '%Rayman%' ;;
        label: "Rayman"
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
        sql: ${name} LIKE '%Bonk%'
                  AND ${name} != 'Bonka'
                  AND ${name} != 'Bonkheads'
                  AND ${name} NOT LIKE '%Bonkers%';;
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
        sql: ${name} LIKE 'Halo:%'
                  OR ${name} LIKE '%Halo 3%'
                  OR ${name} LIKE 'Halo %';;
        label: "Halo"
      }
      when: {
        sql: ${name} LIKE 'Call of Duty%';;
        label: "Call of Duty"
      }
      when: {
        sql: ${name} LIKE '%Worms%'
          AND ${name} NOT LIKE '%Jim%';;
        label: "Worms"
      }
      when: {
        sql: ${name} LIKE '%Duke%Nukem%';;
        label: "Duke Nukem"
      }
      when: {
        sql: ${name} LIKE '%Nathan%Drake%' OR ${name} LIKE 'Uncharted%:%';;
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
        sql: ${name} LIKE 'Dragon Quest%'
          OR ${name} LIKE '%Dragon Warrior%';;
        label: "Dragon Quest"
      }
      else: "Other"
    }
  }

  dimension: api_test {
    group_label: "Images"
    sql: '1';;
    html:
       <div> </div>
       <img src="https://pokemon-master-trainer.herokuapp.com/api.php?q=mario"  style="max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
 ;;
  }

  dimension: gif_url {
    case: {
      when: {
        sql: ${series} = 'Final Fantasy';;
        label: "https://s11.postimg.org/7s4y777pv/ezgif_1339250537.gif"
      }
      when: {
        sql: ${series} = 'Sonic The Hedgehog';;
        label: "https://s12.postimg.org/imkt6r1zh/ezgif_2133819447.gif"
      }
      when: {
        sql: ${series} = 'Mario';;
        label: "https://s22.postimg.org/tqon0ma01/ezgif_3681071909.gif"
      }
      when: {
        sql: ${series} = 'Mega Man';;
        label: "http://i.giphy.com/PK55P6udUmSPu.gif"
      }
      when: {
        sql: ${series} = 'Call of Duty';;
        label: "http://i.giphy.com/T8rtfi2iK00IU.gif"
      }
      when: {
        sql: ${series} = 'Pac-Man';;
        label: "https://s16.postimg.org/gfknpifs5/ezgif_2576536318.gif"
      }
      when: {
        sql: ${series} = 'Madden NFL';;
        label: "http://i.giphy.com/kNdjr0nRPHxTO.gif"
      }
      when: {
        sql: ${series} = 'Street Fighter';;
        label: "https://s11.postimg.org/48fhy987n/ezgif_3577204249.gif"
      }
      when: {
        sql: ${series} = 'Tomb Raider';;
        label: "http://i.giphy.com/WkuLHM3uGHSAE.gif"
      }
      when: {
        sql: ${series} = 'Tetris';;
        label: "https://s13.postimg.org/ceh4m2ijr/ezgif_1011869008.gif"
      }
      when: {
        sql: ${series} = 'Pokemon';;
        label: "http://i.giphy.com/qcx4hzsY8n6FO.gif"
      }
      when: {
        sql: ${series} = 'Worms';;
        label: "http://i.giphy.com/j0tASyEf9wH6M.gif"
      }
      when: {
        sql: ${series} = 'Resident Evil';;
        label: "http://i.giphy.com/hji6ZMztu4unm.gif"
      }
      when: {
        sql: ${series} = 'Mortal Kombat';;
        label: "http://i.giphy.com/72v5BY3vFkSCA.gif"
      }
      when: {
        sql: ${series} = 'Bomberman';;
        label: "https://s18.postimg.org/gl37if915/ezgif_842190678.gif"
      }
      when: {
        sql: ${series} = 'Donkey Kong';;
        label: "https://s13.postimg.org/x9jnlx73r/ezgif_2082221191.gif"
      }
      when: {
        sql: ${series} = 'The Legend of Zelda';;
        label: "https://s9.postimg.org/9nwg7eqsf/ezgif_3980330143.gif"
      }
      when: {
        sql: ${series} = 'Kirby';;
        label: "http://i.giphy.com/wRmOK4J2261gI.gif"
      }
      when: {
        sql: ${series} = 'Castlevania';;
        label: "https://s21.postimg.org/vtxv2gcd3/ezgif_1316443048.gif"
      }
      when: {
        sql: ${series} = 'Bonk';;
        label: "https://s17.postimg.org/ln3t7dmpr/ezgif_4114690391.gif"
      }
      when: {
        sql: ${series} = 'Metal Gear';;
        label: "https://s21.postimg.org/r9iqv9giv/ezgif_1075249640.gif"
      }
      when: {
        sql: ${series} = 'Duke Nukem';;
        label: "http://i.giphy.com/PFDKWUsh5auQg.gif"
      }
      when: {
        sql: ${series} = 'Halo';;
        label: "http://i.giphy.com/RzYrhuxnoe91K.gif"
      }
      when: {
        sql: ${series} = 'Crash Bandicoot';;
        label: "https://s18.postimg.org/nu0r9jrtl/ezgif_2055134094.gif"
      }
      when: {
        sql: ${series} = 'Metroid';;
        label: "https://s18.postimg.org/ldyxvp9qx/ezgif_3754811271.gif"
      }

      when: {
        sql: ${series} = 'Uncharted';;
        label: "https://s14.postimg.org/jytneojc1/ezgif_3936007060.gif"
      }
      when: {
        sql: ${series} = 'Ratchet & Clank';;
        label: "https://s12.postimg.org/3psvj9c99/ezgif_2117624514.gif"
      }
      when: {
        sql: ${series} = 'Phoenix Wright';;
        label: "http://i.giphy.com/eXgOq9ZqvcHu.gif"
      }
      when: {
        sql: ${series} = 'Professor Layton';;
        label: "https://s11.postimg.org/ubdtxjloz/ezgif_2375709908.gif"
      }
      when: {
        sql: ${series} = 'Dragon Quest';;
        label: "https://s9.postimg.org/y2ttxfqj3/ezgif_2678558225.gif"
      }
      when: {
        sql: ${series} = 'Rayman';;
        label: "http://i.giphy.com/bDUfHeBl80tLa.gif"
      }
      when: {
        sql: ${series} = 'FIFA Soccer';;
        label: "http://i.giphy.com/qBYY1bBX10Y6I.gif"
      }
      when: {
        sql: ${series} = 'The Sims';;
        label: "http://www.picgifs.com/games-gifs/games-gifs/de-sims/picgifs-de-sims-8212374.gif"
      }
      when: {
        sql: ${series} = 'Fire Emblem';;
        label: "https://s22.postimg.org/ibpcuksfl/ezgif_3511318288.gif"
      }
      #else: "https://jimpix.co.uk/ink/ecards/angif_pinkevich_catphones.gif"
      else: "http://pokemon-master-trainer.herokuapp.com/api.php?q="
    }
  }
  dimension: image_url {
    case: {
      when: { sql: ${series} = 'Final Fantasy';;  label:
        "https://s15.postimg.org/kos50e2ij/moogle.png"
      } when: { sql: ${series} = 'Sonic the Hedgehog';;  label:
        "https://s22.postimg.org/hs15lwnn5/sonic.png"
      } when: { sql: ${series} = 'Mario';;  label:
        "https://s13.postimg.org/hvp50hxxj/mario.png"
      } when: { sql: ${series} = 'Mega Man'  ;;label:
        "https://s13.postimg.org/lmm7yxwl3/megaman.png"
      } when: { sql: ${series} = 'Call of Duty';;  label:
        "https://s11.postimg.org/w1nsu01rn/price.png"
      } when: { sql: ${series} = 'Pac-Man';;  label:
        "https://s13.postimg.org/qn7nhb5dz/pacman.png"
      } when: { sql: ${series} = 'Madden NFL';;  label:
        "https://s21.postimg.org/pzyg588ef/madden.png"
      } when: { sql: ${series} = 'Street Fighter';;  label:
        "https://s12.postimg.org/db1t96nbh/ryu.png"
      } when: { sql: ${series} = 'Tomb Raider';;  label:
        "https://s22.postimg.org/jsdn4as41/laracroft.png"
      } when: { sql: ${series} = 'Tetris' ;; label:
        "https://s22.postimg.org/iuvyui1w1/tetris.png"
      } when: { sql: ${series} = 'Pokemon';;  label:
        "https://s17.postimg.org/v3fpggksv/pikachu.png"
      } when: { sql: ${series} = 'Worms';;  label:
        "https://s14.postimg.org/7lmygy80x/worms.png"
      } when: { sql: ${series} = 'Resident Evil';;  label:
        "https://s11.postimg.org/4rtoihl7n/residentevil.png"
      } when: { sql: ${series} = 'Mortal Kombat' ;; label:
        "https://s17.postimg.org/gvl303cm7/subzero.png"
      } when: { sql: ${series} = 'Bomberman';;  label:
        "https://s10.postimg.org/ytbsr5ka1/bomberman.png"
      } when: { sql: ${series} = 'Donkey Kong';;  label:
        "https://s13.postimg.org/bgav7lno7/image.png"
      } when: { sql: ${series} = 'The Legend of Zelda' ;; label:
        "https://s21.postimg.org/ni22dixav/link.jpg"
      } when: { sql: ${series} = 'Kirby' ;; label:
        "https://s18.postimg.org/u88krhegp/kirby.png"
      } when: { sql: ${series} = 'Castlevania';;  label:
        "https://s21.postimg.org/69vo7ginb/dracula.png"
      } when: { sql: ${series} = 'Bonk' ;; label:
        "https://s16.postimg.org/yf5lmgjwl/bonk.png"
      } when: { sql: ${series} = 'Metal Gear';;  label:
        "https://s21.postimg.org/xtz1qmg7b/snake.png"
      } when: { sql: ${series} = 'Duke Nukem' ;; label:
        "https://s9.postimg.org/li1y3relb/dukenukem.png"
      } when: { sql: ${series} = 'Halo' ;; label:
        "https://s9.postimg.org/dcfxqgm3z/masterchief.png"
      } when: { sql: ${series} = 'Crash Bandicoot';;  label:
        "https://s22.postimg.org/rq0ixiy1d/crash.png"
      } when: { sql: ${series} = 'Metroid'  ;; label:
        "https://s16.postimg.org/x68atd2ut/samus.png"
      }
      when: { sql: ${series} = 'Uncharted' ;; label:
        "https://s10.postimg.org/xrb4kqld5/nathan.png"
      } when: { sql: ${series} = 'Ratchet & Clank'  ;;label:
        "https://s4.postimg.org/4t83l3oxp/ratchet.png"
      } when: { sql: ${series} = 'Phoenix Wright' ;; label:
        "https://s10.postimg.org/gl8b3brux/phoenix.png"
      } when: { sql: ${series} = 'Professor Layton' ;; label:
        "https://s11.postimg.org/fr89ud6hf/Screen_Shot_2016_10_16_at_11_59_52_AM.png"
      } when: { sql: ${series} = 'Dragon Quest' ;; label:
        "https://s11.postimg.org/bmfibvf6b/slime.png"
      } when: { sql: ${series} = 'Rayman';;  label:
        "https://s15.postimg.org/5cxue1023/Rayman_1200.jpg"
      } when: { sql: ${series} = 'FIFA Soccer';;  label:
        "https://s22.postimg.org/dzxocimpd/Capture.png"
      } when: { sql: ${series} = 'The Sims' ;; label:
        "https://s9.postimg.org/sewrll0lb/The_Sims_Logo_1.png"
      } when: { sql: ${series} = 'Fire Emblem' ;; label:
        "https://upload.wikimedia.org/wikipedia/en/5/5a/MarthFE3DS.png"
      }
      else: "http://pokemon-master-trainer.herokuapp.com/api.php?q="

    }
  }
  dimension: mascot_gif {
    label: "GIF icon with Title"
    group_label: "Images"
    sql: ${gif_url};;
    html:

            <div style="width: 80px; text-align: center; margin: auto">
            <img src=
    {% if value == 'http://pokemon-master-trainer.herokuapp.com/api.php?q=' %} "https://pokemon-master-trainer.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game%25animated%25gif"
    {% else %} "{{value}}"
    {% endif %}
            alt="{{series}}" style="height: 75px; width: 75px; border-radius: 8px; margin-bottom: 5px;" />
            </br>{{ series }}
            </div>
             ;;
  }

  dimension: mascot_gif_large {
    label: "Animated GIF"
    group_label: "Images"
    sql: ${gif_url};;
    html:

            <div style="width: 200px; text-align: center; margin: auto">
            <img src=
    {% if value == 'http://pokemon-master-trainer.herokuapp.com/api.php?q=' %} "https://pokemon-master-trainer.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game%25animated%25gif"
    {% else %} "{{value}}"
    {% endif %}
            alt="{{series}}" style="height: 200px; width: 200px; border-radius: 20px; margin-bottom: 5px;" />
            </div>
             ;;
  }
  dimension: mascot_image {
    label: "Large Image"
    group_label: "Images"
    sql: ${image_url};;
    html:
            <div style="width: 300px; text-align: center; margin: auto">
            <img src=
            {% if value == 'http://pokemon-master-trainer.herokuapp.com/api.php?q=' %} "https://pokemon-master-trainer.herokuapp.com/api.php?q={{ parameter_taker | replace: '%', ' ' | url_param_escape }}%25video%25game"
            {% else %} "{{value}}"
            {% endif %}

            alt="{{series}}" style=" max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
            </div>
             ;;
  }
  dimension:  is_virtual_console {
    type: yesno
    hidden: yes
    sql: (${console} = 'Wii' AND ${year} < 2006) OR (${console} = 'Nintendo 3DS' AND ${year} < 2011) ;;
  }

  measure: count {
    type: count
    drill_fields: [console, name, year]
  }
  measure: count_consoles {
    type: count_distinct
    drill_fields: [console]
    sql:  ${console} ;;
  }
  measure: earliest_year {
    type: min
    sql: ${year}  ;;
  }
  measure: latest_year {
    type: max
    sql: ${year}  ;;
  }

}
