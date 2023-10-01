CREATE TABLE "monsters_import"
(
    name                     TEXT,
    id                       INTEGER,
    image                    TEXT,
    flags                    TEXT,
    nocopy_precombat         BOOLEAN default FALSE,
    nocopy_postcombat        BOOLEAN default FALSE,
    name_manuel              TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Manuel: "') THEN substr(flags,
                                                                                                      instr(flags, 'Manuel: "') +
                                                                                                      length('Manuel: "'),
                                                                                                      instr(
                                                                                                              substr(flags, instr(flags, 'Manuel: "') + length('Manuel: "')),
                                                                                                              '"') -
                                                                                                      1) END) virtual,
    name_wiki                TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Wiki: "') THEN substr(flags,
                                                                                                    instr(flags, 'Wiki: "') +
                                                                                                    length('Wiki: "'),
                                                                                                    instr(
                                                                                                            substr(flags, instr(flags, 'Wiki: "') + length('Wiki: "')),
                                                                                                            '"') -
                                                                                                    1) END) virtual,
    nocopy                   BOOLEAN generated always as (flags GLOB '*NOCOPY*') virtual,
    nomanuel                 BOOLEAN generated always as (flags GLOB '*NOMANUEL*') virtual,
    boss                     BOOLEAN generated always as (flags GLOB '*BOSS*') virtual,
    copy                     BOOLEAN generated always as (CASE
                                                              WHEN nocopy THEN FALSE
                                                              WHEN boss THEN FALSE
                                                              WHEN nocopy_precombat THEN FALSE
                                                              WHEN nomanuel THEN FALSE
                                                              ELSE TRUE END) virtual,
    wish                     BOOLEAN generated always as (CASE
                                                              WHEN nocopy THEN FALSE
                                                              WHEN boss THEN FALSE
                                                              WHEN nocopy_postcombat THEN FALSE
                                                              WHEN nomanuel THEN FALSE
                                                              ELSE TRUE END) virtual,
    nobanish                 BOOLEAN generated always as (flags GLOB '*NOBANISH*') virtual,
    banish                   BOOLEAN generated always as (CASE WHEN boss THEN false ELSE NOT nobanish END) virtual,
    nowander                 BOOLEAN generated always as (flags GLOB '*NOWANDER*') virtual,
    wander                   BOOLEAN generated always as (CASE WHEN boss THEN false ELSE NOT nowander END) virtual,
    free                     BOOLEAN generated always as (flags GLOB '*FREE*') virtual,
    ghost                    BOOLEAN generated always as (flags GLOB '*GHOST*') virtual,
    snake                    BOOLEAN generated always as (flags GLOB '*SNAKE*') virtual,
    drippy                   BOOLEAN generated always as (flags GLOB '*DRIPPY*') virtual,
    wanderer                 BOOLEAN generated always as (flags GLOB '*WANDERER*') virtual,
    ultrarare                BOOLEAN generated always as (flags GLOB '*ULTRARARE*') virtual,
    lucky                    BOOLEAN generated always as (flags GLOB '*LUCKY*') virtual,
    superlikely              BOOLEAN generated always as (flags GLOB '*SUPERLIKELY*') virtual,
    article                  TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Article: ') THEN CASE
                                                                                                   WHEN instr(
                                                                                                           substr(flags, instr(flags, 'Article: ') + length('Article: ')),
                                                                                                           ' ')
                                                                                                       THEN substr(
                                                                                                           flags,
                                                                                                           instr(flags, 'Article: ') +
                                                                                                           length('Article: '),
                                                                                                           instr(
                                                                                                                   substr(flags, instr(flags, 'Article: ') + length('Article: ')),
                                                                                                                   ' ') -
                                                                                                           1)
                                                                                                   ELSE substr(flags, instr(flags, 'Article: ') + length('Article: ')) END END) virtual,
    phylum                   TEXT generated always as (CASE
                                                           WHEN instr(flags, ' P: ') THEN CASE
                                                                                              WHEN instr(substr(flags, instr(flags, ' P: ') + length(' P: ')), ' ')
                                                                                                  THEN substr(flags,
                                                                                                              instr(flags, ' P: ') +
                                                                                                              length(' P: '),
                                                                                                              instr(substr(flags, instr(flags, ' P: ') + length(' P: ')), ' ') -
                                                                                                              1)
                                                                                              ELSE substr(flags, instr(flags, ' P: ') + length(' P: ')) END END) virtual,
    element                  TEXT generated always as (CASE
                                                           WHEN instr(flags, 'E: ') THEN CASE
                                                                                             WHEN instr(substr(flags, instr(flags, 'E: ') + length('E: ')), ' ')
                                                                                                 THEN substr(flags,
                                                                                                             instr(flags, 'E: ') +
                                                                                                             length('E: '),
                                                                                                             instr(substr(flags, instr(flags, 'E: ') + length('E: ')), ' ') -
                                                                                                             1)
                                                                                             ELSE substr(flags, instr(flags, 'E: ') + length('E: ')) END END) virtual,
    "group"                  INTEGER generated always as (CASE
                                                              WHEN instr(flags, 'Group: ') THEN CASE
                                                                                                    WHEN instr(
                                                                                                            substr(flags, instr(flags, 'Group: ') + length('Group: ')),
                                                                                                            ' ')
                                                                                                        THEN substr(
                                                                                                            flags,
                                                                                                            instr(flags, 'Group: ') +
                                                                                                            length('Group: '),
                                                                                                            instr(
                                                                                                                    substr(flags, instr(flags, 'Group: ') + length('Group: ')),
                                                                                                                    ' ') -
                                                                                                            1)
                                                                                                    ELSE substr(flags, instr(flags, 'Group: ') + length('Group: ')) END END) virtual,
    attack                   TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Atk: ') THEN CASE
                                                                                               WHEN instr(
                                                                                                       substr(flags, instr(flags, 'Atk: ') + length('Atk: ')),
                                                                                                       ' ') THEN substr(
                                                                                                       flags,
                                                                                                       instr(flags, 'Atk: ') +
                                                                                                       length('Atk: '),
                                                                                                       instr(
                                                                                                               substr(flags, instr(flags, 'Atk: ') + length('Atk: ')),
                                                                                                               ' ') -
                                                                                                       1)
                                                                                               ELSE substr(flags, instr(flags, 'Atk: ') + length('Atk: ')) END END) virtual,
    defence                  TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Def: ') THEN CASE
                                                                                               WHEN instr(
                                                                                                       substr(flags, instr(flags, 'Def: ') + length('Def: ')),
                                                                                                       ' ') THEN substr(
                                                                                                       flags,
                                                                                                       instr(flags, 'Def: ') +
                                                                                                       length('Def: '),
                                                                                                       instr(
                                                                                                               substr(flags, instr(flags, 'Def: ') + length('Def: ')),
                                                                                                               ' ') -
                                                                                                       1)
                                                                                               ELSE substr(flags, instr(flags, 'Def: ') + length('Def: ')) END END) virtual,
    hitpoints                TEXT generated always as (CASE
                                                           WHEN instr(flags, 'HP: ') THEN CASE
                                                                                              WHEN instr(substr(flags, instr(flags, 'HP: ') + length('HP: ')), ' ')
                                                                                                  THEN substr(flags,
                                                                                                              instr(flags, 'HP: ') +
                                                                                                              length('HP: '),
                                                                                                              instr(substr(flags, instr(flags, 'HP: ') + length('HP: ')), ' ') -
                                                                                                              1)
                                                                                              ELSE substr(flags, instr(flags, 'HP: ') + length('HP: ')) END END) virtual,
    initiative               TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Init: ') THEN CASE
                                                                                                WHEN instr(
                                                                                                        substr(flags, instr(flags, 'Init: ') + length('Init: ')),
                                                                                                        ' ')
                                                                                                    THEN substr(flags,
                                                                                                                instr(flags, 'Init: ') +
                                                                                                                length('Init: '),
                                                                                                                instr(
                                                                                                                        substr(flags, instr(flags, 'Init: ') + length('Init: ')),
                                                                                                                        ' ') -
                                                                                                                1)
                                                                                                ELSE substr(flags, instr(flags, 'Init: ') + length('Init: ')) END END) virtual,
    scale                    TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Scale: ') THEN CASE
                                                                                                 WHEN instr(
                                                                                                         substr(flags, instr(flags, 'Scale: ') + length('Scale: ')),
                                                                                                         ' ')
                                                                                                     THEN substr(flags,
                                                                                                                 instr(flags, 'Scale: ') +
                                                                                                                 length('Scale: '),
                                                                                                                 instr(
                                                                                                                         substr(flags, instr(flags, 'Scale: ') + length('Scale: ')),
                                                                                                                         ' ') -
                                                                                                                 1)
                                                                                                 ELSE substr(flags, instr(flags, 'Scale: ') + length('Scale: ')) END END) virtual,
    ceiling                  TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Cap: ') THEN CASE
                                                                                               WHEN instr(
                                                                                                       substr(flags, instr(flags, 'Cap: ') + length('Cap: ')),
                                                                                                       ' ') THEN substr(
                                                                                                       flags,
                                                                                                       instr(flags, 'Cap: ') +
                                                                                                       length('Cap: '),
                                                                                                       instr(
                                                                                                               substr(flags, instr(flags, 'Cap: ') + length('Cap: ')),
                                                                                                               ' ') -
                                                                                                       1)
                                                                                               ELSE substr(flags, instr(flags, 'Cap: ') + length('Cap: ')) END END) virtual,
    floor                    TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Floor: ') THEN CASE
                                                                                                 WHEN instr(
                                                                                                         substr(flags, instr(flags, 'Floor: ') + length('Floor: ')),
                                                                                                         ' ')
                                                                                                     THEN substr(flags,
                                                                                                                 instr(flags, 'Floor: ') +
                                                                                                                 length('Floor: '),
                                                                                                                 instr(
                                                                                                                         substr(flags, instr(flags, 'Floor: ') + length('Floor: ')),
                                                                                                                         ' ') -
                                                                                                                 1)
                                                                                                 ELSE substr(flags, instr(flags, 'Floor: ') + length('Floor: ')) END END) virtual,
    resistance_physical      TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Phys: ') THEN CASE
                                                                                                WHEN instr(
                                                                                                        substr(flags, instr(flags, 'Phys: ') + length('Phys: ')),
                                                                                                        ' ')
                                                                                                    THEN substr(
                                                                                                        flags,
                                                                                                        instr(flags, 'Phys: ') +
                                                                                                        length('Phys: '),
                                                                                                        instr(
                                                                                                                substr(flags, instr(flags, 'Phys: ') + length('Phys: ')),
                                                                                                                ' ') -
                                                                                                        1)
                                                                                                ELSE substr(flags, instr(flags, 'Phys: ') + length('Phys: ')) END END) virtual,
    resistance_elemental     TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Elem: ') THEN CASE
                                                                                                WHEN instr(
                                                                                                        substr(flags, instr(flags, 'Elem: ') + length('Elem: ')),
                                                                                                        ' ')
                                                                                                    THEN substr(flags,
                                                                                                                instr(flags, 'Elem: ') +
                                                                                                                length('Elem: '),
                                                                                                                instr(
                                                                                                                        substr(flags, instr(flags, 'Elem: ') + length('Elem: ')),
                                                                                                                        ' ') -
                                                                                                                1)
                                                                                                ELSE substr(flags, instr(flags, 'Elem: ') + length('Elem: ')) END END) virtual,
    monster_level_multiplier TEXT generated always as (CASE
                                                           WHEN instr(flags, 'MLMult: ') THEN CASE
                                                                                                  WHEN instr(
                                                                                                          substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')),
                                                                                                          ' ')
                                                                                                      THEN substr(
                                                                                                          flags,
                                                                                                          instr(flags, 'MLMult: ') +
                                                                                                          length('MLMult: '),
                                                                                                          instr(
                                                                                                                  substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')),
                                                                                                                  ' ') -
                                                                                                          1)
                                                                                                  ELSE substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')) END END) virtual,
    experience               TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Exp: ') THEN CASE
                                                                                               WHEN instr(
                                                                                                       substr(flags, instr(flags, 'Exp: ') + length('Exp: ')),
                                                                                                       ' ') THEN substr(
                                                                                                       flags,
                                                                                                       instr(flags, 'Exp: ') +
                                                                                                       length('Exp: '),
                                                                                                       instr(
                                                                                                               substr(flags, instr(flags, 'Exp: ') + length('Exp: ')),
                                                                                                               ' ') -
                                                                                                       1)
                                                                                               ELSE substr(flags, instr(flags, 'Exp: ') + length('Exp: ')) END END) virtual,
    poison                   TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Poison: "') THEN substr(flags,
                                                                                                      instr(flags, 'Poison: "') +
                                                                                                      length('Poison: "'),
                                                                                                      instr(
                                                                                                              substr(flags, instr(flags, 'Poison: "') + length('Poison: "')),
                                                                                                              '"') -
                                                                                                      1) END) virtual,
    item                     TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Item: ') THEN CASE
                                                                                                WHEN instr(
                                                                                                        substr(flags, instr(flags, 'Item: ') + length('Item: ')),
                                                                                                        ' ')
                                                                                                    THEN substr(flags,
                                                                                                                instr(flags, 'Item: ') +
                                                                                                                length('Item: '),
                                                                                                                instr(
                                                                                                                        substr(flags, instr(flags, 'Item: ') + length('Item: ')),
                                                                                                                        ' ') -
                                                                                                                1)
                                                                                                ELSE substr(flags, instr(flags, 'Item: ') + length('Item: ')) END END) virtual,
    skill                    TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Skill: ') THEN CASE
                                                                                                 WHEN instr(
                                                                                                         substr(flags, instr(flags, 'Skill: ') + length('Skill: ')),
                                                                                                         ' ')
                                                                                                     THEN substr(flags,
                                                                                                                 instr(flags, 'Skill: ') +
                                                                                                                 length('Skill: '),
                                                                                                                 instr(
                                                                                                                         substr(flags, instr(flags, 'Skill: ') + length('Skill: ')),
                                                                                                                         ' ') -
                                                                                                                 1)
                                                                                                 ELSE substr(flags, instr(flags, 'Skill: ') + length('Skill: ')) END END) virtual,
    spell                    TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Spell: ') THEN CASE
                                                                                                 WHEN instr(
                                                                                                         substr(flags, instr(flags, 'Spell: ') + length('Spell: ')),
                                                                                                         ' ')
                                                                                                     THEN substr(flags,
                                                                                                                 instr(flags, 'Spell: ') +
                                                                                                                 length('Spell: '),
                                                                                                                 instr(
                                                                                                                         substr(flags, instr(flags, 'Spell: ') + length('Spell: ')),
                                                                                                                         ' ') -
                                                                                                                 1)
                                                                                                 ELSE substr(flags, instr(flags, 'Spell: ') + length('Spell: ')) END END) virtual,
    meat                     TEXT generated always as (CASE
                                                           WHEN instr(flags, 'Meat: ') THEN CASE
                                                                                                WHEN instr(
                                                                                                        substr(flags, instr(flags, 'Meat: ') + length('Meat: ')),
                                                                                                        ' ')
                                                                                                    THEN substr(flags,
                                                                                                                instr(flags, 'Meat: ') +
                                                                                                                length('Meat: '),
                                                                                                                instr(
                                                                                                                        substr(flags, instr(flags, 'Meat: ') + length('Meat: ')),
                                                                                                                        ' ') -
                                                                                                                1)
                                                                                                ELSE substr(flags, instr(flags, 'Meat: ') + length('Meat: ')) END END) virtual,
    sprinkles_min            TEXT generated always as (CASE
                                                           WHEN instr(flags, 'SprinkleMin: ') THEN CASE
                                                                                                       WHEN instr(
                                                                                                               substr(
                                                                                                                       flags,
                                                                                                                       instr(flags, 'SprinkleMin: ') +
                                                                                                                       length('SprinkleMin: ')),
                                                                                                               ' ')
                                                                                                           THEN substr(
                                                                                                               flags,
                                                                                                               instr(flags, 'SprinkleMin: ') +
                                                                                                               length('SprinkleMin: '),
                                                                                                               instr(
                                                                                                                       substr(
                                                                                                                               flags,
                                                                                                                               instr(flags, 'SprinkleMin: ') +
                                                                                                                               length('SprinkleMin: ')),
                                                                                                                       ' ') -
                                                                                                               1)
                                                                                                       ELSE substr(
                                                                                                               flags,
                                                                                                               instr(flags, 'SprinkleMin: ') +
                                                                                                               length('SprinkleMin: ')) END END) virtual,
    sprinkles_max            TEXT generated always as (CASE
                                                           WHEN instr(flags, 'SprinkleMax: ') THEN CASE
                                                                                                       WHEN instr(
                                                                                                               substr(
                                                                                                                       flags,
                                                                                                                       instr(flags, 'SprinkleMax: ') +
                                                                                                                       length('SprinkleMax: ')),
                                                                                                               ' ')
                                                                                                           THEN substr(
                                                                                                               flags,
                                                                                                               instr(flags, 'SprinkleMax: ') +
                                                                                                               length('SprinkleMax: '),
                                                                                                               instr(
                                                                                                                       substr(
                                                                                                                               flags,
                                                                                                                               instr(flags, 'SprinkleMax: ') +
                                                                                                                               length('SprinkleMax: ')),
                                                                                                                       ' ') -
                                                                                                               1)
                                                                                                       ELSE substr(
                                                                                                               flags,
                                                                                                               instr(flags, 'SprinkleMax: ') +
                                                                                                               length('SprinkleMax: ')) END END) virtual
)
